require 'rubygems'
require 'mechanize'
require 'nokogiri' # gem install nokogiri
require 'csv'
require 'dimensions'
require 'writeexcel'  
require "open-uri"

workbook = WriteExcel.new('dimennsion.xls')
worksheet  = workbook.add_worksheet

format = workbook.add_format
counter3=0


csv_text = File.read('red.csv',encoding: "iso-8859-1:UTF-8")
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
   File.open(loc2<<"_"<<loc4<<"."<<loc3},"wb") do |file|


     file.puts f.read
     file_name=loc2<<"_"<<loc4<<"."<<loc3
     size=Dimensions.dimensions(file_name)
     puts "Size="<<size
     worksheet.write("C"<<counter3.to_s,size.split.join(" "), format) 
    counter3+=1
   end
}

end

workbook.close