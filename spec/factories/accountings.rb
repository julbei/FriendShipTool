# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :accounting do
    group_id 1
    paid_by 1
    amount "9.99"
  end
end
