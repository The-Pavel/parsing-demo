require 'json'
require 'open-uri'

# TODO - Let's fetch name and bio from a given GitHub username
url = 'https://api.github.com/users/ssaunier'
json_file = open(url).read
user_hash = JSON.parse(json_file)
puts "Username: #{user_hash["name"]}, lives in #{user_hash["location"]}, works at #{user_hash["company"]}"

puts "Which brand do you want to buy?"
brand = gets.chomp

url = "http://makeup-api.herokuapp.com/api/v1/products.json?brand=#{brand}"

json_file = open(url).read
cosmetics_array = JSON.parse(json_file)

puts "We found #{cosmetics_array.size} products"

# .first(x) takes the first x elements of an array into a smaller array
cosmetics_array.first(10).each do |product|
  puts product["name"]
  puts "Price: #{product["price"].to_f.round}USD"
  puts "Product type: #{product["product_type"].capitalize}"
end










