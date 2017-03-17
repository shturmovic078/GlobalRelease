require 'rubygems'
require 'mechanize'
require 'nokogiri' # gem install nokogiri
require 'csv'


require "open-uri"





csv_text = File.read('red_canada.csv',encoding: "iso-8859-1:UTF-8")
csv = CSV.parse(csv_text, :headers => true)
csv.each do |row|  
sleep 4
loc1= "#{row['url']}"
loc2= "#{row['name']}"
loc3= "#{row['type']}"
loc4= "#{row['extra']}"

puts loc1
puts loc2




open(loc1) {|f|
   File.open("RedlobsterCanada/#{loc2<<"_"<<loc4<<"."<<loc3}","wb") do |file|
     file.puts f.read
   end
}

end

