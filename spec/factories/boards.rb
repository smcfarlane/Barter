# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :board do
    association :user, factory: :user
    skill_needed "plumbing"
    skills_offered ["IT, sewing"]
    details {{'city' => 'Cool city', 'email' => 'example@example.com'}}
    status "awiating"
    needed_by {1.week.from_now}
  end
end
