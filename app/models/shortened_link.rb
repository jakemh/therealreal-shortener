class ShortenedLink < ActiveRecord::Base

  MIN_SEED = 100000
  DEFAULT_BASE = 32

  validates :url,
    presence: true
  
  validates :encoded_string,
    presence: true, 
    uniqueness: true

  validates :base,
    presence: true


  def self.build_from_uri(uri, base = DEFAULT_BASE)
    ShortenedLink.new(
      url: self.validate_url(uri),
      encoded_string: self.encoded_string(base),
      base: DEFAULT_BASE
      )
  end

  def shortened_url(base)
    File.join(base, self.encoded_string)
  end

  private
  def self.encoded_string(base)
    Conversions::EncodeInteger.new(encode_seed).encode(base)
  end

  def self.validate_url(uri)
    if Utilities::Http::url?(uri)
      uri
    else
      # this doesn't nearly guarantee that it's a proper url but close enough for now 
      uri.prepend("http://")
    end
  end

  def self.encode_seed
    next_available_id = ShortenedLink.maximum(:id).to_i.next

    # ensure minimum value and reduce liklihood of race condition
    # by adding an arbitrary value
    next_available_id + MIN_SEED

  end

end
