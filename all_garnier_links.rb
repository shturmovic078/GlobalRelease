#!/usr/bin/ruby


require 'mechanize'
require 'writeexcel'
require 'rubygems'
workbook = WriteExcel.new('56.xls')
counter=0
# Add worksheet(s)
worksheet  = workbook.add_worksheet






format = workbook.add_format
format.set_bold
format.set_color('black')
format.set_align('left')
temp = " "
original=0
count=1
url = "http://www.garnierusa.com/products/styling.aspx"
agent = Mechanize.new
page = agent.get(url)
page.links.each {|link| puts "#{link.text} => #{link.href}"


worksheet.write("A"<<original.to_s,url, format) 

worksheet.write("B"<<original.to_s,"Links on the page", format) 




if ( link.href =~ /reviews$/ ||  link.text =~ /^$/ ||  link.href =~ /^$/ || link.href =~ /^#/ || link.href.length < 2 || link.text.length < 2 || temp == link.text)  

	puts "This is a duplicate link"

else
  worksheet.write("A"<<count.to_s,link.text.split.join(" "), format) 

worksheet.write("B"<<count.to_s,link.href, format) 

count +=1

temp = link.text

end






}

workbook.close