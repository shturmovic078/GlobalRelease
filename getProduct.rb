require 'rubygems'
require 'csv'
require 'writeexcel'
require 'nokogiri'
require 'open-uri'
require 'rubygems'




cell = "RELATED CONTENT"
count = 3 
workbook = WriteExcel.new('data_write1.xls')
worksheet  = workbook.add_worksheet
puts "Here I'm"
#csv_text = File.read('z1.csv',encoding: "iso-8859-1:UTF-8")
csv_text = File.read('temp.csv',encoding: "iso-8859-1:UTF-8")
csv = CSV.parse(csv_text, :headers => true)



  
csv.each do |row|  
sleep 
loc1= "#{row['url']}"


temp="grid_item--link"
puts "Look at URL"
page = Nokogiri::HTML(open(loc1))   
puts "Loading"
news_links = page.css("a").select{|link| link['class'] == temp}
news_links.each{|link| puts link['href'] 
worksheet.write(1,counter, link['href'])  
}




   # worksheet.write(cell<<" "<<count.to_s, link['href'])  
   
 


count+=1;

end
workbook.close 
