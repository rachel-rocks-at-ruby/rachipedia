require 'faker'

# Create Users
5.times do
  user = User.new(
    name:     Faker::Name.name,
    email:    Faker::Internet.email,
    password: Faker::Lorem.characters(10)
  )
  user.skip_confirmation!
  user.save!
end
users = User.all

# Create Wikis
50.times do
  Wiki.create!(
    user:   users.sample,
    title:  Faker::Lorem.sentence,
    body:   Faker::Lorem.paragraph
  )
end
wikis = Wiki.all

 # Create an admin user
 admin = User.new(
   name:     'Admin User',
   email:    'admin@example.com',
   password: 'helloworld',
   role:     'admin'
 )
 admin.skip_confirmation!
 admin.save!
 
 # Create a premium user
 moderator = User.new(
   name:     'Premium User',
   email:    'premium@example.com', 
   password: 'helloworld',
   role:     'premium'
 )
 moderator.skip_confirmation!
 moderator.save!
 
 # Create a standard user
 member = User.new(
   name:     'Standard User',
   email:    'member@example.com',
   password: 'helloworld',
   role:     'standard'
 )
 member.skip_confirmation!
 member.save!

puts "Seed finished"
puts "#{Wiki.count} posts created"