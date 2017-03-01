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
workbook = WriteExcel.new('global.xls')
worksheet  = workbook.add_worksheet

#format excel

# Add and define a format
format = workbook.add_format
format.set_bold
format.set_color('black')
format.set_align('left')

#setup CSV


csv_text = File.read('onlyProducts.csv')
csv = CSV.parse(csv_text, :headers => true)
csv.each do |row|  
sleep 4
loc1= "#{row['url']}"

       puts loc1
       puts "Number of products #"<<loc1.scan(/products/).length

       temp = loc1.scan(/products/).length
       if temp.to_i == 1

        puts "fount a category link"<<" "<<counter1.to_s


        worksheet.write("A"<<counter1.to_s,loc1,format)   
       
      else
       
        worksheet.write("B"<<counter1.to_s,loc1,format)  
        puts "found product link"<<" "<<counter1.to_s

        counter1+=1
      end



        
       
    




end



workbook.close