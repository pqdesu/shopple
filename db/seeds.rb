require "open-uri"
require "json"

# Reset the database
puts "Cleaning the database..."

OrderItem.destroy_all
puts "Deleted OrderItem"
CartItem.destroy_all
puts "Deleted CartItem"
Product.destroy_all
puts "Deleted Products"
puts "..."

# Get data from API
puts "Fetching data from FakeStoreAPI..."
products_data = JSON.parse(URI.open("https://fakestoreapi.com/products").read)
puts "..."

puts "Creating Products"
#  Category must exist, Price can't be blank, Price is not a number, Category can't be blank
products_data.each do |product|
  Product.create!(
    name: product["title"],
    category: product["category"],
    price: product["price"]
  )
  puts "Created #{product["title"]}"
end

puts "------------------------------------------------"
puts "SEEDING COMPLETE!"
puts "Products created:   #{Product.count}"
puts "------------------------------------------------"
