# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :skills_user do
    association :user, factory: :user
    association :skills, factory: :skill
    details "These are some riveting details."
  end
end
