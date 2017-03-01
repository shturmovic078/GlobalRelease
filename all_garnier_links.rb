#!/usr/bin/ruby


require 'mechanize'
require 'writeexcel'
require 'rubygems'
require 'csv'
workbook = WriteExcel.new('1577.xls')
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
url_get=0
related_get=0
url_text=2
url_address=3

# go into the loop 

csv_text = File.read('all.csv')
csv = CSV.parse(csv_text, :headers => true)
csv.each do |row|  
sleep 4
loc1= "#{row['url']}"


agent = Mechanize.new
page = agent.get(loc1)
page.links.each {|link| puts "#{link.text} => #{link.href}"

worksheet.write(0,url_get,url, format) 

worksheet.write(1,related_get,"Links on the page", format) 




#if ( link.href =~ /reviews$/ ||  link.text =~ /^$/ ||  link.href =~ /^$/ || link.href =~ /^#/ || link.href.length < 2 || link.text.length < 2 || temp == link.href)  
if ( link.href =~ /reviews$/ ||  link.text =~ /^$/ ||  link.href =~ /^$/ || link.href =~ /^#/ ||  temp == link.href)  
	puts "This is a duplicate link"



else
  worksheet.write(2,url_text,link.text.split.join(" "), format) 

worksheet.write(3,url_address,link.href, format) 

count +=1
url_get +=1;
related_get+=1
url_text+=1;
url_address+=1;
temp = link.href

end






}

end

workbook.close