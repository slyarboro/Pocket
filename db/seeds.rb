# Seeding random for practice before making the lorem ipsum
require 'faker'

 # Create Topics
 15.times do
   Topic.create!(
     title:  Faker::90s.sentence
   )
 end

 # Create Bookmarks
 topics = Topic.all
 30.times do
   Bookmark.create!(
   url: Faker::Internet.url
   topics: topics.sample
   )
 end

 puts "Seed finished"
 puts "#{Topic.count} topics created"
 puts "#{Bookmark.count} bookmarks created"
