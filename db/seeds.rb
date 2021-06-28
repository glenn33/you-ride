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
10.times do |index|
  user = User.new(
    email: Faker::Internet.email,
    password: "123456"
    )
  user.save!
end

puts "Creating vehicle"
CATEGORIES = ["Bicycle", "E-bike", "Scooter"]
10.times do |index|
  vehicle = Vehicle.new(
    category: CATEGORIES.sample,
    user: User.all.sample
    )
  vehicle.save!
end

puts "Creating booking"
10.times do |index|
  booking = Booking.create!(
    user: User.all.sample,
    vehicle: Vehicle.all.sample
    )
end




