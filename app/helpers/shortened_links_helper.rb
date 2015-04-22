module ShortenedLinksHelper
  def formatted_date(stamp)
    "#{time_ago_in_words(stamp)} ago"
  end
end
