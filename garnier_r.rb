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

#format excel

# Add and define a format
format = workbook.add_format
format.set_bold
format.set_color('black')
format.set_align('left')

#setup CSV


csv_text = File.read('gl.csv')
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

        if temp.include? "Product Line"
        worksheet.write("B"<<counter2.to_s,"Product Line",format) 	
        counter2+=1
        value = temp.split("Product Line")
        end

        if temp.include? "Related Products"
        worksheet.write("B"<<counter2.to_s,"Related Products",format) 	
        counter2+=1
        value = temp.split("Related Product")
        end
        




       value = temp.split(")")
          value.each do |value|

    worksheet.write("B"<<counter2.to_s,value.split.join(" ")) 
    puts value
        counter2+=1
end


counter1=counter2
        
       
    end




end



workbook.close