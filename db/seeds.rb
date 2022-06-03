# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
Booking.destroy_all
Item.destroy_all
User.destroy_all

# categories = ["hoodie", "hat", "shoes", "hoodie", "harness"]
# User.create(email: "tilly@tilly.com", password: 123456, first_name: "Tilly", last_name: "Bishop", rating: 7)
# User.create(email: "craig@craig.com", password: 123456, first_name: "Craig", last_name: "Norford", rating: 3)
# User.create(email: "olivia@olivia.com", password: 123456, first_name: "Olivia", last_name: "McSweeney", rating: 8)
# User.create(email: "emily@emily.com", password: 123456, first_name: "Emily", last_name: "Tregelles", rating: 9)

# Item.create!(user: User.all.sample,
#             price: rand(1..150),
#             name: "Louise Vuitton jumper",
#             size: "Small",
#             availability: true,
#             description: "Cute pink jumper with hearts and rhinestones on it.",
#             rating: 8,
#             category: categories.sample,
#             address: "Hoxton, London")

# Item.create!(user: User.all.sample,
#             price: rand(1..150),
#             name: "Primarni bra",
#             size: "Large",
#             availability: false,
#             description: "Big lacy black bra.",
#             rating: 7,
#             category: categories.sample,
#             address: "Islington, London")

# Item.create!(user: User.all.sample,
#             price: rand(1..150),
#             name: "Jimmy Choo Choo Heels",
#             size: "Medium",
#             availability: true,
#             description: "8 inch snake skin platform heels. Super cute for wearing around the dog park!",
#             rating: 10,
#             category: categories.sample,
#             address: "Manchester")

# Item.create!(user: User.all.sample,
#             price: rand(1..150),
#             name: "Gucki belt",
#             size: "Small",
#             availability: false,
#             description: "Dark brown belt with flashing lights for accessorising your pups cute little belly!",
#             rating: 4,
#             category: categories.sample,
#             address: "Times Square, New York")

# Item.create!(user: User.all.sample,
#             price: rand(1..150),
#             name: "Prader dress",
#             size: "Medium",
#             availability: true,
#             description: "Floor length LBD. Not recommended to wear to the park.",
#             rating: 2,
#             category: categories.sample,
#             address: "Bern, Switzerland")
