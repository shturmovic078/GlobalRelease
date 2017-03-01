require 'nokogiri'
require 'open-uri'
require 'rubygems'
require 'csv'
require 'writeexcel'  
workbook = WriteExcel.new('5links.xls')
worksheet  = workbook.add_worksheet

format = workbook.add_format
counter1=1
counter2=2


# Add and define a format
format = workbook.add_format
format.set_bold
format.set_color('green')
format.set_align('right')




counter1=1

csv_text = File.read('temp1.csv')
csv = CSV.parse(csv_text, :headers => true)
csv.each do |row|  
sleep 4
loc1= "#{row['url']}"


 #Get the product url



page = Nokogiri::HTML(open(loc1))   
puts "Loading"

 

sleep 15
news_links = page.css("a").select{|link| link['class'] == "grid_item--link"}
news_links.each{|link| puts link['href'] 
 
puts "Output URL"
  worksheet.write(""<<counter1.to_s,loc1,format) 
  sleep 2
  puts "Output URL on cell "<<counter1.to_s
  counter1+=1
  
  worksheet.write("B"<<counter2.to_s,link['href']) 
   counter2+=1





}

end

counter1+=m.to_i+1
counter2+=m.to_i+1



workbook.close

