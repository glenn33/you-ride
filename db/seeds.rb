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
cities = ["Braunschweig", "Roma", "Madrid", "Berlin", "Amsterdam", "London"]
images = ["http://www.loultimo.com.co/wp-content/uploads/2019/02/190123_eMove-Cruiser-de-Voro-Motors_001-800x509.jpg", "https://trinityviajes.com/wp-content/uploads/2020/10/whatsapp-image-2020-10-23-at-16-08-15-2.jpeg", "https://chargemap.s3.amazonaws.com/charging_pool_photos/url/840x560/38045/e-moveme_23394.jpeg", "https://move-e.es/uploaded/producto_37/foto4402a2img9325.jpg", "https://move-e.es/uploaded/producto_0114/fotod794c93e2f3a585d371c381d82430a7e33feca.temp.jpg", "https://resizer.glanacion.com/resizer/ObOe3CC2qnDaFcE8SShCKrirkSw=/879x586/smart/filters:quality(80)/cloudfront-us-east-1.images.arcpublishing.com/lanacionar/NPCJPY5RDZAXRETRS3PPHYUD2Y.jpg", "https://yofuiaegb.com/wp-content/uploads/2014/09/El-rocomovil.jpg", "https://yofuiaegb.com/wp-content/uploads/2014/09/El-espantomovil1.jpg", "https://yofuiaegb.com/wp-content/uploads/2014/09/El-auto-superconvertible.jpg", "https://yofuiaegb.com/wp-content/uploads/2014/09/El-stuka-rakuda.jpg", "https://yofuiaegb.com/wp-content/uploads/2014/09/El-superchatarra-especial.jpg", "https://yofuiaegb.com/wp-content/uploads/2014/09/La-antigualla-blindada.jpg", "https://yofuiaegb.com/wp-content/uploads/2014/09/El-auto-doble-cero.png"]
titles = ["En dos ruedas", "Bike Around", "Bike it now", "E-bikes rental", "Down town bikes & scooters", "Suzan bikes", "Easy bike rent", "Wheely bikes", "My scooters for you", "Oh My Bike", "Glenchuky bikes", "Santi inmobiliarias y alquiler de bicis"]
10.times do |index|
  vehicle = Vehicle.new(
    category: CATEGORIES.sample,
    user: User.all.sample,
    price: rand(8..15),
    image_url: images.sample,
    location: cities.sample,
    title: titles.sample,
    description: Faker::Quote.most_interesting_man_in_the_world
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




