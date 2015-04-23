FactoryGirl.define do

  factory :shortened_link do
      url "http://www.test.com"
      encoded_string "5yc1s"
      base 36
    end

end
