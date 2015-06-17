# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :skill_user do
    association :user, factory: :user
    skill_id 4
    user_id 23
    details "These are some riveting details."
  end
end
