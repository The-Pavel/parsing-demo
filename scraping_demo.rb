require 'open-uri'
require 'nokogiri'

# Let's scrape recipes from http://www.epicurious.com

# puts "What ingredient do you want to search"
# ingredient = gets.chomp


url = "letscookfrench.html"

html_file = open(url).read
html_doc = Nokogiri::HTML(html_file)


html_doc.search('.m_titre_resultat').first(5).each do |element|
  sleep(5)
  puts element.text.strip
  recipe_path = element.search('a').attribute('href').value
  recipe_url = "http://www.letscookfrench.com" + recipe_path
  puts "Follow this link for instructions - #{recipe_url}").read
end

