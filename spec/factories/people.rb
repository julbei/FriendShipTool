# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :person do
    name "MyString"
    user_id 1
    group_id 1
    balance "9.99"
  end
end
