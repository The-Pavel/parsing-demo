require 'json'

# TODO - let's read/write data from beers.json
### PARSING / READING FROM
file_path = "data/beers.json"

json_string = File.read(file_path)

ruby_hash = JSON.parse(json_string)

ruby_hash["beers"].each do |beer|
  puts "#{beer["name"]} has a #{beer["appearance"]} look and is from #{beer["origin"]}"
end


### STORING / WRITING TO
array_of_beers = ruby_hash["beers"] # an Array of all the beers
new_beer = {
  name: "Snow",
  appearance: "Very Light",
  origin: "China"
}

array_of_beers.push(new_beer)

File.open(file_path, 'wb') do |file|
  file.write(JSON.generate(ruby_hash))
end


