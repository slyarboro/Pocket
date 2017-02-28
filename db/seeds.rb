require 'faker'

## user
4.times do
  User.create!(
  email: Faker::Internet.email,
  password: Faker::Internet.password,
)
end

User.create!(
  email: "browsertrousers@example.com",
  password: "cargo"
)

users = User.all

## topic
12.times do
  Topic.create!(
  title: Faker::Lorem.word,
  user: users.sample
  )
end
topics = Topic.all

## bookmark
24.times do
  Bookmark.create!(
  topic: topics.sample,
  user: users.sample,
  url: Faker::Internet.url
  )
end
bookmarks = Bookmark.all

puts "Seed finished"
puts "#{User.count} users created"
puts "#{Topic.count} topics created"
puts "#{Bookmark.count} bookmarks created"
