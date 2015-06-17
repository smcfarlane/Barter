FactoryGirl.define do
  factory :address do
      street_address "1234 d st"
      street_address2 "unit f"
      city "Poway"
      state "CA"
      zip "123445"
  end

  factory :user_info do
    first_name "Tom"
    last_name "Rodriguez"
  end


  factory :user do
    email "test@test.com"
    password "asdfasdf"
  end
end