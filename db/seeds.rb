# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require "open-uri"

Review.destroy_all
puts "reviews destroyed"

Booking.destroy_all
puts "bookings destroyed"

Pitch.destroy_all
puts "pitches destroyed"

User.destroy_all
puts "users destroyed"

# user seeds
user1 = User.create!(email: "user1@lewagon.com", password: 123456, first_name: "Pedro", last_name: "Romariz")
user2 = User.create!(email: "user2@lewagon.com", password: 123456, first_name: "Rui", last_name: "Morim")
user3 = User.create!(email: "user3@lewagon.com", password: 123456, first_name: "Bernardo", last_name: "Mendes")

puts "Users created"

# pitch seeds
pitch1 = Pitch.new(name: "Catedral", price: 9999999, location: "Lisboa", pitch_type: "Football", available: false, user: user1)
#image for pitch 1
file = URI.open("https://res.cloudinary.com/dghvhwirp/image/upload/v1677667082/Pitches%20for%20fun/est%C3%A1dio_da_luz_exymbx.jpg")
pitch1.photo.attach(io: file, filename: "estadio-luz.jpg", content_type: "image/jpg")
puts "hi"
pitch1.save
puts "pitch 1 created"

pitch2 = Pitch.new(name: "Estádio Municipal de Lousada", price: 100, location: "Lousada", pitch_type: "Field-Hockey", available: true, user: user2)

#image for pitch 2
file = URI.open("https://res.cloudinary.com/dghvhwirp/image/upload/v1677667080/Pitches%20for%20fun/campo-desportivo-lousada_q4xmag.webp")
pitch2.photo.attach(io: file, filename: "estadio_lousada.jpg", content_type: "image/webp")
pitch2.save
puts "pitch 2 created"

pitch3 = Pitch.new(name: "KFC Yum! Center", price: 5000, location: "Louisville", pitch_type: "Basketball", available: false, user: user3)

#image for pitch 3
file = URI.open("https://res.cloudinary.com/dghvhwirp/image/upload/v1677667082/Pitches%20for%20fun/kfc-yum-center_xwdcvw.jpg")
pitch3.photo.attach(io: file, filename: "KFC_Yum!_Center.jpg", content_type: "image/jpg")
pitch3.save
puts "pitch 3 created"

pitch4 = Pitch.new(name: "Top-padel Fluvial", price: 70, location: "Porto", pitch_type: "Padel", available: true, user: user1)

#image for pitch 4
file = URI.open("https://res.cloudinary.com/dghvhwirp/image/upload/v1677667082/Pitches%20for%20fun/top-padel-fluvial_zkshir.jpg")
pitch4.photo.attach(io: file, filename: "Top_padel_Fluvial.jpg", content_type: "image/jpg")
pitch4.save
puts "pitch 4 created"

pitch5 = Pitch.new(name: "Estádio da Póvoa Varzim", price: 150, location: "Póvoa do Varzim", pitch_type: "Hockey", available: false, user: user2)

#image for pitch 5
file = URI.open("https://res.cloudinary.com/dghvhwirp/image/upload/v1677667081/Pitches%20for%20fun/est%C3%A1dio-varzim_ocpgdh.webp")
pitch5.photo.attach(io: file, filename: "Estádio_da_Póvoa_Varzim.jpg", content_type: "image/webp")
pitch5.save
puts "pitch 5 created"

pitch6 = Pitch.new(name: "Arthur Ashe Stadium", price: 6950, location: "New York", pitch_type: "Tenis", available: true, user: user3)

#image for pitch 6
file = URI.open("https://res.cloudinary.com/dghvhwirp/image/upload/v1677667081/Pitches%20for%20fun/arthur-ashe-stadium-_efluqv.jpg")
pitch6.photo.attach(io: file, filename: "Arthur_Ashe_Stadium.jpg", content_type: "image/jpg")
pitch6.save
puts "pitch 6 created"

pitch7 = Pitch.new(name: "Bangkok Arena", price: 650, location: "Bangkok", pitch_type: "Futsal", available: false, user: user1)

#image for pitch 7
file = URI.open("https://res.cloudinary.com/dghvhwirp/image/upload/v1677667081/Pitches%20for%20fun/bangkok_futsal_arena_z6zmg9.jpg")
pitch7.photo.attach(io: file, filename: "Bangkok_Arena.jpg", content_type: "image/jpg")
pitch7.save
puts "pitch 7 created"

pitch8 = Pitch.new(name: "Saitama Super Arena", price: 300, location: "Japan", pitch_type: "Volleyball", available: true, user: user2)

#image for pitch 8
file = URI.open("https://res.cloudinary.com/dghvhwirp/image/upload/v1677667080/Pitches%20for%20fun/Saitama_Super_Arena_u5trjb.jpg")
pitch8.photo.attach(io: file, filename: "Saitama_Super_Arena.jpg", content_type: "image/jpg")
pitch8.save
puts "pitch 8 created"

pitch9 = Pitch.new(name: "MVM Dome", price: 975, location: "Budapest", pitch_type: "Handball", available: false, user: user3)

#image for pitch 9
file = URI.open("https://res.cloudinary.com/dghvhwirp/image/upload/v1677667080/Pitches%20for%20fun/MVM-Dome_j2zglh.png")
pitch9.photo.attach(io: file, filename: "MVM_Dome.jpg", content_type: "image/png")
pitch9.save
puts "pitch 9 created"

puts "All Pitches created"

# booking and reviews seeds
Pitch.all.each do |pitch|
  start_time = DateTime.now + (rand * 21)
  end_time = start_time + 1.hours
  booking = Booking.create!(start_time: start_time, end_time: end_time, total_price: pitch.price, pitch: pitch, user: User.all.sample)
  puts "booking created for #{pitch.name}"
  Review.create!(rating: rand(0..5), comment: Faker::Lorem.sentence(word_count: 3, supplemental: true, random_words_to_add: 5), booking: booking)
  puts "review created"
end

puts "Booking and Reviews created"
