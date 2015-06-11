FactoryGirl.define do
  sequence :id do |n|
    n
  end

  sequence :first_name do |n|
    "dude#{n}"
  end

  sequence :last_name do |n|
    "duderson#{n}"
  end

  sequence :email do |n|
    "dude_#{n}@example.com"
  end

  sequence :street_address do |n|
    "123#{n} thing st"
  end

  factory :user_info do
    first_name "Billy"
    last_name "Bob"
    user
  end

  factory :address do
    street_address
    street_address2 "unit f"
    city "San Diego"
    state "CA"
    zip "12344"
    user
  end

  factory :user do
    id
    email
    password "asdfasdf"
  end
end