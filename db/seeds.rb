# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).

###### DELETING EVERYTHING FIRST ########
Skill.delete_all
User.delete_all
UserInfo.delete_all
Address.delete_all
Phone.delete_all
Email.delete_all
Board.delete_all
Category.delete_all
MessageThread.delete_all
Message.delete_all
Subscriber.delete_all
#########################################


# Create Skills
skills = ['IT', 'carpentry', 'plumbing', 'interior design', 'sewing']
skills.each do |skill|
  Skill.create(name: skill)
end

# Real Addresses
@address_0 = {street_address: '14411 Elmport Lane', city: 'Poway', state: 'CA', zip: '92064'}
@address_1 = {street_address: '1918 Oceanside Blvd', city: 'Oceanside', state: 'CA', zip: '92054'}
@address_2 = {street_address: '5267 La Jolla Blvd', city: 'San Diego', state: 'CA', zip: '92037'}
@address_3 = {street_address: '119 E Grand Ave', city: 'Escondido', state: 'CA', zip: '92025'}
@address_4 = {street_address: '3401 E Speedway Blvd', city: 'Tucson', state: 'AZ', zip: '85716'}

# Create Users
5.times do |i|
  password = 'password'
  fname = Faker::Name.first_name
  lname = Faker::Name.last_name
  email = Faker::Internet.free_email("#{fname}.#{lname}")
  user = User.create(email: email, password: password, password_confirmation: password)
  UserInfo.create(first_name: fname, last_name: lname, user_id: user.id)
  address = Address.create( instance_variable_get("@address_#{i}") )
  address.user_id = i
  user.addresses <<  address
  Phone.create(phone: Faker::PhoneNumber.phone_number, user_id: user.id)
end

# Add Skills to users
User.all.each do |user|
  3.times {user.skills << Skill.find_by_name(skills.sample)}
end

# Create Boards
15.times do
  users = User.all.to_a.sample(5)
  user = users.shift
  users_skills = user.skills.pluck(:name)
  board = Board.create(user_id: user.id, skill_needed: [skills[rand(0..4)]], skills_offered: users_skills,
               details: {city: user.addresses[0].city, email: user.email}, needed_by: Faker::Date.between(Date.today, 2.months.from_now))

  thread = MessageThread.create(title: "#{user.user_info.first_name} Item Discussion")
  thread.update_attribute(:discussable, board)
  4.times {Message.create(user_id: users.sample.id, message_thread_id: thread.id, text: Faker::Hacker.say_something_smart)}
  
  Agreement.create(status: 'pending', user1skill: board.skills_offered.sample, user2skill: board.skill_needed[0], due_date: Faker::Date.between(Date.today, 3.months.from_now), board_id: board.id, user_id: users.sample.id, user1_agrees: [true, false].sample, user2_agrees: [true, false].sample, details: Faker::Lorem.paragraph)
end
