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
User.create(email: "santi@gmail.com", password: "123456", full_name: "santi")
User.create(email: "martin@gmail.com", password: "123456", full_name: "martin")
User.create(email: "glenn@gmail.com", password: "123456", full_name: "glenn")
