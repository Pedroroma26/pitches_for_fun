# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
Booking.destroy_all
puts "bookings destroyed"

Pitch.destroy_all
puts "pitches destroyed"

User.destroy_all
puts "pitches destroyed"

# user seeds
user1 = User.create!(email: "user1@lewagon.com", password: 123456, first_name: "Pedro", last_name: "Romariz")
user2 = User.create!(email: "user2@lewagon.com", password: 123456, first_name: "Rui", last_name: "Morim")
user3 = User.create!(email: "user3@lewagon.com", password: 123456, first_name: "Bernardo", last_name: "Mendes")

# pitch seeds
pitch1 = Pitch.create!(name: "Catedral", price: 9999999, location: "Lisboa", pitch_type: "Football", available: false, user: user1)
pitch2 = Pitch.create!(name: "Estádio Minucipal de Lousada", price: 100, location: "Lousada", pitch_type: "Field-Hockey", available: true, user: user1)
pitch3 = Pitch.create!(name: "KFC Yum! Center", price: 5000, location: "Louisville", pitch_type: "Basketball", available: false, user: user1)
pitch4 = Pitch.create!(name: "Top-padel Fluvial", price: 70, location: "Porto", pitch_type: "Padel", available: true, user: user1)
pitch5 = Pitch.create!(name: "Estádio da Póvoa Varzim", price: 150, location: "Póvoa do Varzim", pitch_type: "Hockey", available: false, user: user1)
pitch6 = Pitch.create!(name: "Arthur Ashe Stadium", price: 6950, location: "New York", pitch_type: "Tenis", available: true, user: user1)
pitch7 = Pitch.create!(name: "Bangkok Arena", price: 650, location: "Bangkok", pitch_type: "Futsal", available: false, user: user1)
pitch8 = Pitch.create!(name: "Saitama Super Arena", price: 300, location: "Japan", pitch_type: "Volleyball", available: true, user: user1)
pitch9 = Pitch.create!(name: "MVM Dome", price: 975, location: "Budapest", pitch_type: "Handball", available: false, user: user1)

# booking and reviews seeds
Pitch.all.each do |pitch|
  start_time = DateTime.now + (rand * 21)
  end_time = start_time + 1.hours
  booking = Booking.create!(start_time: start_time, end_time: end_time, total_price: pitch.price, pitch: pitch, user: User.all.sample)
  puts "booking created for #{pitch.name}"
  Review.create!(rating: rand(0..5), comment: Faker::Lorem.sentence(word_count: 3, supplemental: true, random_words_to_add: 5), booking: booking)
  puts "review created"
end
