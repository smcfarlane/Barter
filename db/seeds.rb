# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).


5.times do |i|
  password = 'password' + i.to_s
  User.create(email: Faker::Internet.email, password: password, password_confirmation: password,
               user_info_attributes: {first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, user_id: 1},
               addresses_attributes: [{street_address: Faker::Address.street_address, city: Faker::Address.city, state: Faker::Address.state_abbr, zip: Faker::Address.zip_code, user_id: 1}],
               phones_attributes: [{phone: Faker::PhoneNumber.phone_number, user_id: 1}])
  puts "user #{i}"
end

1.times do |i|
  MessageThread.create(discussable_id: 1, discussable_type: 'user', title: 'User Thread')
  puts "thread #{i}"
end

10.times do |i|
  Message.create(user_id: 1, message_thread_id: 0, text: Faker::Lorem.sentences(2, true).join(' '))
  puts "message #{i}"
end

3.times do |i|
  Skill.create(id: i, name: Faker::Hacker.ingverb)
  SkillsUser.create(user_id: 6, skill_id: i, details: Faker::Hacker.say_something_smart)
end