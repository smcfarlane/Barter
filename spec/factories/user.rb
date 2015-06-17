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

  factory :emails do
    email
  end

  factory :user_info do
    first_name "Billy"
    last_name "Bob"
  end

  factory :phone do
    phone "4445556666"
  end

  factory :address do
    street_address
    street_address2 "unit f"
    city "San Diego"
    state "CA"
    zip "12344"
  end

  factory :user do
    id
    email
    password "asdfasdf"
    association :user_info, factory: :user_info, strategy: :build
    # association :addresses, factory: :address, strategy: :build
    # association :phones, factory: :phone, strategy: :build
  end
end