require 'nokogiri'
require 'open-uri'
require 'rubygems'
require 'csv'
require 'writeexcel'  
workbook = WriteExcel.new('emails.xls')
worksheet  = workbook.add_worksheet

format = workbook.add_format
video_line="stop"



worksheet.write(0, 0, 'Product Details Link', format)
worksheet.write(0,1 , 'Product Line', format)
worksheet.write(0,2, 'Related Products', format)
counter1=1
counter2=1
counter3=1
csv_text = File.read('pkt_draeger_list.csv')
csv = CSV.parse(csv_text, :headers => true)
csv.each do |row|  
sleep 4
loc1= "#{row['url']}"


if loc1.include? "@draeger.com"
 worksheet.write("B"<<counter1.to_s,loc1) 
  sleep 2
  
 else
  worksheet.write("A"<<counter1.to_s,loc1) 
  sleep 2
   counter1+=1
end
 
  
end






workbook.close

