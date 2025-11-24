require "open-uri"
require "json"

# Reset the database
puts "Cleaning the database..."

OrderItem.destroy_all
CartItem.destroy_all
Product.destroy_all
Category.destroy_all
puts "..."

# Get data from API
puts "Fetching data from FakeStoreAPI..."

response = URI.open("https://fakestoreapi.com/products").read
products_data = JSON.parse(response)
puts "..."

puts "Creating Categories and Products"

#  Category must exist, Price can't be blank, Price is not a number, Category can't be blank
products_data.each do |product|
  category_data = Category.find_or_create_by!(name: product["category"])
  Product.create!(
    name: product["title"],
    category: category_data,
    price: product["price"]
  )
  puts "Created #{product["title"]}"
end

puts "------------------------------------------------"
puts "SEEDING COMPLETE!"
puts "Categories created: #{Category.count}"
puts "Products created:   #{Product.count}"
puts "------------------------------------------------"
