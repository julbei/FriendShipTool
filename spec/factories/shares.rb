# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :share do
    accounting nil
    lender_id 1
    borrower_id 1
    amount "9.99"
  end
end
