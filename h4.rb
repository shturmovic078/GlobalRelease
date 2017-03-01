#!/usr/bin/ruby
require 'nokogiri'    
require 'open-uri'
require 'writeexcel' 
require 'rubygems'
require 'watir'
require 'csv'

max=0
counter1=1
counter2=1
workbook = WriteExcel.new('temp3.xls')
worksheet  = workbook.add_worksheet

format = workbook.add_format
format.set_bold
format.set_color('black')
format.set_align('right')


csv_text = File.read('temp2.csv')
csv = CSV.parse(csv_text, :headers => true)
csv.each do |row|  
sleep 4
loc1= "#{row['url']}"

       puts loc1
       counter1=counter2
       worksheet.write("A"<<counter1.to_s,loc1) 

doc = Nokogiri::HTML(open(loc1))


		
		doc.css('.carousel-product').each do |link|   

			
        puts link.text.split.join(" ")
        temp = link.text
        values = temp.split(")")

# Display each value to the console.
values.each do |value|
    worksheet.write("B"<<counter2.to_s,value.split.join(" ")) 
    puts value
        counter2+=1
end



        
       
    end




end




workbook.close