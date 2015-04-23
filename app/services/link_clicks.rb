class LinkClicks
  
  attr_accessor :shortened_link

  def initialize(shortened_link)
    self.shortened_link = shortened_link
  end

  def click_count
    self.shortened_link.clicks.count
  end

end