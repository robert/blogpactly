# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :post do
    rss_feed_id 1
    title "MyString"
    snippet "MyString"
  end
end
