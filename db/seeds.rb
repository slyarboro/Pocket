# Seeding random for practice before making the lorem ipsum
require 'faker'

 # Create Topics
 15.times do
   Topic.create!(
     title:  Faker::Lorem.word
   )
 end

 topics = Topic.all

 # Create Bookmarks
 10.times do
   Bookmark.create!(
    url: Faker::Internet.url
   topics: topics.sample
   )
 end

 # puts "Seed finished"
 puts "#{Topic.count} topics created"
 puts "#{Bookmark.count} bookmarks created"
