# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
User.destroy_all
User.create(username: Faker::Internet.user_name, password: "password")
User.create(username: Faker::Internet.user_name, password: "password")
User.create(username: Faker::Internet.user_name, password: "password")

Sub.destroy_all
Sub.create(title: "League of Legends", description: "A sub about the online game: League of Legends", user_id: User.first.id)
Sub.create(title: "Overwatch", description: "A sub about the online game: Overwatch", user_id: User.first.id)
Sub.create(title: "Street Fighter", description: "A sub about the online game: Overwatch", user_id: User.first.id)
Sub.create(title: "PUBG", description: "A sub about the online game: Overwatch", user_id: User.first.id)
Sub.create(title: "CounterStrike", description: "A sub about the online game: Overwatch", user_id: User.first.id)
Sub.create(title: "Dota", description: "A sub about the online game: Overwatch", user_id: User.first.id)
