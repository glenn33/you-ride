# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

User.destroy_all
Vehicle.destroy_all
Booking.destroy_all


puts "Creating users"
User.create(email: "santi@gmail.com", password: "123456", full_name: "santi", profile_picture: "https://ca.slack-edge.com/T02NE0241-U022TP90K0Q-a08af8898f25-72", full_name: "Santiago Altamira")
User.create(email: "martin@gmail.com", password: "123456", full_name: "martin", profile_picture: "https://ca.slack-edge.com/T02NE0241-U02241PPHAN-7dc694ba7505-72", full_name: "Martin Karlsson")
User.create(email: "glenn@gmail.com", password: "123456", full_name: "glenn", profile_picture: "https://ca.slack-edge.com/T02NE0241-U0220SK6J5B-34ace59e8d53-512", full_name: "Glenn Gunter")
