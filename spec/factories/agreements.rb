# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :agreement do
    status 'pending'
    user1skill 'plumbing'
    user2skill 'IT'
    due_date 1.week.from_now
    association :user, factory: :user
    user1_agrees false
    user2_agrees false
    details Faker::Lorem.sentence(8, true, 6)
  end
end