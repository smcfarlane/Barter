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



skills = ['IT', 'carpentry', 'plumbing', 'interior design', 'sewing']
skills.each do |skill|
  Skill.create(name: skill)
end

5.times do |i|
  password = 'password' + i.to_s
  User.create(email: Faker::Internet.email, password: password, password_confirmation: password,
               user_info_attributes: {first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, user_id: 1},
               addresses_attributes: [{street_address: Faker::Address.street_address, city: Faker::Address.city, state: Faker::Address.state_abbr, zip: Faker::Address.zip_code, user_id: 1}],
               phones_attributes: [{phone: Faker::PhoneNumber.phone_number, user_id: 1}])
  puts "user #{i}"
end

User.all.each do |user|
  skill1 = Skill.find_by_name(skills.sample)
  skill2 = Skill.find_by_name(skills.sample)
  user.skills << skill1
  user.skills << skill2
end

5.times do |i|
  user = User.find(User.pluck(:id).sample)
  users_skills = user.skills.pluck(:name)
  b = Board.create(user_id: user.id, skill_needed: [skills[rand(0..4)]], skills_offered: users_skills,
               details: {city: user.addresses[0].city, email: user.email}, needed_by: rand(1..3).week.from_now)

  thread = MessageThread.create(title: "#{user.user_info.first_name} Item Discussion")
  thread.update_attribute(:discussable, b)
end

# Messages seeding
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