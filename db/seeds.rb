# # Seeding random for practice before making the lorem ipsum
# require 'faker'
#
#  # Create Topics
#  15.times do
#    Topic.create!(
#      title:  Faker::Lorem.word
#    )
#  end
#
#  topics = Topic.all
#
#  # Create Bookmarks
#  10.times do
#    Bookmark.create!(
#     url: Faker::Internet.url
#    topics: topics.sample
#    )
#  end
#
#  # puts "Seed finished"
#  puts "#{Topic.count} topics created"
#  puts "#{Bookmark.count} bookmarks created"
#
#


user = User.new(
name: "SLY",
username: "sly",
email: "slyarbor@ncsu.edu",
passord: "mikejones",
)

user.skip_confirmation!
user.save!



#
# # Seeding random for practice before making the lorem ipsum
# # require 'faker'
#
# User.create!(
# email: "stephanieyarboro@gmail.com",
# username: "slyarboro",
# password: "puffdaddy"
# )
#
# User.create!(
# email: "slyarbor@ncsu.edu"
# username: "galaxygirl"
# password: "pdiddy"
# )
#
# # user.skip_confirmation!
# # user.save!
# users = User.all
#
#
#
Topic.create!(
title: "Neigh",
user: users.waitwhat
)

Topic.create!(
title: "Ginuwine",
user: users.waitwhat
)

Topic.create!(
title: "Ron Swanson",
user: users.waitwhat
)
topics = Topic.all

#
# Bookmark.create!(
# user: users.waitwhat,
# url: "http://bit.ly/2lHIzXl",
# topic_id: 1
# )
#
# Bookmark.create!(
# user: users.waitwhat,
# url: "http://bit.ly/2l1pbAS",
# topic_id: 2
# )
#
# Bookmark.create!(
# user: users.waitwhat,
# url: "http://mylittlepony.hasbro.com/en-us",
# topic_id: 3
# )
#
# bookmarks = Bookmark.all
#  #
#  # Create Topics
#  # 24.times do
#  #   Topic.create!(
#  #     title:  Faker::Lorem.word,
#  #   )
#  # end
#  #
#  #
#  # # Create Bookmarks
#  # 10.times do
#  #   Bookmark.create!(
#  #    url: Faker::Internet.url
#  #   topics: topics.sample
#  #   )
#  # end
#  #
#  # puts "Seed finished"
#  puts "#{User.count} users created"
#  puts "#{Topic.count} topics created"
#  puts "#{Bookmark.count} bookmarks created"
