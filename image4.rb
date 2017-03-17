require 'rubygems'
require 'mechanize'
require 'nokogiri' # gem install nokogiri
require 'csv'
require 'dimensions'
require 'writeexcel'  
require "open-uri"

workbook = WriteExcel.new('dimennsion_v_6.xls')
worksheet  = workbook.add_worksheet

format = workbook.add_format
counter3=0


csv_text = File.read('redLink6.csv',encoding: "iso-8859-1:UTF-8")
csv = CSV.parse(csv_text, :headers => true)
csv.each do |row|  
sleep 4
loc1= "#{row['url']}"
loc2= "#{row['name']}"


puts loc1
puts loc2




open(loc1) {|f|
	  temp2="#{loc2}"
     puts "Filename is "<<temp2
   File.open(temp2,"wb") do |file|


     file.puts f.read

   
     size=Dimensions.dimensions(temp2)
     puts "Size="<<size.to_s
     puts File.size?(temp2)
     temp = File.size?(temp2)
    # puts "File Size="<<File.size?(temp2)
    sleep 2
     worksheet.write("A"<<counter3.to_s,loc1.to_s, format) 
     worksheet.write("B"<<counter3.to_s,loc2.to_s, format) 
    worksheet.write("C"<<counter3.to_s,temp.to_s, format) 
     worksheet.write("D"<<counter3.to_s,size.to_s, format) 
    counter3+=1
   end
}

end

workbook.close