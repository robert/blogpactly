# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :debt do
    debtor_id 1
    sender_id 1
    pact_id 1
    amount 1
    paid false
  end
end
