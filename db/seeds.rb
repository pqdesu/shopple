require "open-uri"
require "json"

# Reset the database
puts "Cleaning the database..."
puts "..."

OrderItem.destroy_all
puts "Deleted OrderItem"
CartItem.destroy_all
puts "Deleted CartItem"
Product.destroy_all
puts "Deleted Products"
User.destroy_all
puts "Deleted Users"
Review.destroy_all
puts "Deleted Reviews"
puts "..."

# Get data from API
puts "Fetching data from FakeStoreAPI..."
products_data = JSON.parse(URI.open("https://fakestoreapi.com/products").read)
puts "..."

puts "Creating Products"
puts "..."
#  Category must exist, Price can't be blank, Price is not a number, Category can't be blank
products_data.each do |product|
  Product.create!(
    name: product["title"],
    category: product["category"],
    price: product["price"],
    image_url: product["image"],
    description: product["description"],
    rating_rate: product.dig("rating", "rate"),
    rating_count: product.dig("rating", "count")
  )
  puts "Created #{product["title"]}"
  puts "..."
end

puts "Creating Users..."
puts "..."

users = [
  { first_name: "Alex", last_name: "Morgan", email: "alex.morgan@example.com" },
  {
    first_name: "Hana",
    last_name: "Watanabe",
    email: "hana.watanabe@example.com"
  },
  {
    first_name: "Daniel",
    last_name: "Carter",
    email: "daniel.carter@example.com"
  },
  {
    first_name: "Sophie",
    last_name: "Nakamura",
    email: "sophie.nakamura@example.com"
  },
  {
    first_name: "Lucas",
    last_name: "Bennett",
    email: "lucas.bennett@example.com"
  },
  { first_name: "Maria", last_name: "Silva", email: "maria.silva@example.com" },
  {
    first_name: "Kenji",
    last_name: "Tanaka",
    email: "kenji.tanaka@example.com"
  },
  {
    first_name: "Emma",
    last_name: "Thompson",
    email: "emma.thompson@example.com"
  },
  {
    first_name: "Rafael",
    last_name: "Costa",
    email: "rafael.costa@example.com"
  },
  { first_name: "Julia", last_name: "Klein", email: "julia.klein@example.com" }
]

created_users =
  users.map do |user|
    u =
      User.create!(
        first_name: user[:first_name],
        last_name: user[:last_name],
        email: user[:email],
        password: "password123",
        role: "customer"
      )
    puts "Created user: #{u.first_name} #{u.last_name}"
    puts "..."
    u
  end

puts "Creating Reviews..."
puts "..."

comments = [
  "Great quality, exceeded my expectations.",
  "Pretty good for the price.",
  "Not bad, but could be better.",
  "Amazing! Highly recommended.",
  "Decent product, works as expected.",
  "Average. Nothing special.",
  "Fantastic quality and fast shipping.",
  "Would definitely buy again.",
  "A bit disappointing, expected more.",
  "Solid value overall."
]

Product.find_each do |product|
  review_count = rand(1..10)
  review_count.times do
    Review.create!(
      user: created_users.sample,
      product: product,
      rating: rand(1..5),
      comment: comments.sample
    )
  end
  puts "Added #{review_count} reviews to #{product.name}"
  puts "..."
end

puts "------------------------------------------------"
puts "SEEDING COMPLETE!"
puts "Products created: #{Product.count}"
puts "Users created: #{created_users.count}"
puts "Reviews created: #{Review.count}"
puts "------------------------------------------------"
