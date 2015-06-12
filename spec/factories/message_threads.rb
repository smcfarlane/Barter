# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :message_thread do
    discussable_id 1
    discussable_type "MyString"
    title "MyString"
    active false
  end
end
