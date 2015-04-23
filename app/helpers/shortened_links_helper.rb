module ShortenedLinksHelper
  def formatted_date(stamp)
    "#{time_ago_in_words(stamp)} ago"
  end

  def click_count(shortened_link)
    LinkClicks.new(shortened_link).click_count
  end
  
end
