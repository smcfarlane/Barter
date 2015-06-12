# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :boards do
    user1 1
    user2 1
    skill_needed "MyString"
    skills_offered "MyString"
    details "MyString"
    status "MyString"
    needed_by "2015-06-11"
  end
end
