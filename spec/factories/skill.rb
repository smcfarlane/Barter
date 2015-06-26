# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :skill  do
    # association :user, factory: :user
    # association :skills_users, factory: :skills_user
    name 'Plumbing'
  end
end
