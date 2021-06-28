# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.create(email: 'guinterglenn33@gmail.com', password: '123455')
User.create(email: 'santi@gmail.com', password: '123455')
User.create(email: 'martin@gmail.com', password: '123455')
Vehicle.create(category: 'moto', user: User.first)
Booking.create(user: User.last, vehicle: Vehicle.first)