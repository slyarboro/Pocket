# Seeding random for practice before making the lorem ipsum
require 'random_data'

 # Create Topics
 50.times do
 # #1
   Topic.create!(
 # #2
     title:  RandomData.random_sentence,
     body:   RandomData.random_paragraph
   )
 end
 topics = Topic.all

 # Create Comments
 # #3
 # 100.times do
 #   Comment.create!(
 # # #4
 #     topic: topics.sample,
 #     body: RandomData.random_paragraph
 #   )
 # end

 puts "Seed finished"
 puts "#{Topic.count} topics created"
 # puts "#{Comment.count} comments created"
