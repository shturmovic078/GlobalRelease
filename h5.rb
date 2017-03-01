#!/usr/bin/ruby
require 'nokogiri'    
require 'open-uri'
require 'writeexcel' 
require 'rubygems'
require 'watir'
require 'csv'



#setup excel

counter1=1
counter2=1
workbook = WriteExcel.new('1-100.xls')
worksheet  = workbook.add_worksheet


#setup CSV


csv_text = File.read('h6.csv')
csv = CSV.parse(csv_text, :headers => true)
csv.each do |row|  
sleep 4
loc1= "#{row['url']}"

       puts loc1
       
       worksheet.write("A"<<counter1.to_s,loc1) 
       


doc = Nokogiri::HTML(open(loc1))
	doc.css('.carousel-product').each do |link|   

		puts link.text.split.join(" ")
        
        temp = link.text
        values = temp.split("Whole")

       
        values.each do |value|
    worksheet.write("B"<<counter2.to_s,value.split.join(" ")) 
    puts value
        counter2+=1
end


counter1=counter2
        
       
    end




end




workbook.close

    

