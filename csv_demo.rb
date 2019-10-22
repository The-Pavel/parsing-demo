require 'csv'



## PARSING / READING FROM
file_path = "data/beers.csv"
csv_options = { col_sep: ',', quote_char: '"', headers: :first_row }
CSV.foreach(file_path, csv_options) do |row|
  puts "This is beer is called #{row["Name"]} and it is from #{row["Origin"]}"
end


## STORING / WRITING TO
csv_options = { col_sep: ',', force_quotes: true, quote_char: '"' }
# mode 'a' means add, which is dangerous because we can't check for repetative records
# normally we would use mode 'wb' - write, binary
CSV.open(file_path, 'a', csv_options) do |csv|
  csv << ["Qingtao", "Light Lager", "China"]
end
