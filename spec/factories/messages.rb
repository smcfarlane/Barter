# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :message do
    association :user, factory: :user
    association :message_thread, factory: :message_thread
    text Faker::Hacker.say_something_smart
    active true
  end
end
