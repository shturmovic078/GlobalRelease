require 'writeexcel'
require 'csv'
require 'nokogiri'
require 'open-uri'
require 'rubygems'


# Create a new Excel Workbook
workbook = WriteExcel.new('89.xls')

# Add worksheet(s)
worksheet  = workbook.add_worksheet
cell = "RELATED CONTENT"
counter = 1
add_link = 1
add_link_2=1
csv_text = File.read('temp.csv')
csv = CSV.parse(csv_text, :headers => true)
csv.each do |row|  
sleep 4
loc1= "#{row['url']}"

# Add and define a format
format = workbook.add_format
format.set_bold
format.set_color('red')
format.set_align('right')

# write a formatted and unformatted string.
worksheet.write(0, 0,"URL", format)  # cell B2
worksheet.write(add_link_2, 0,loc1, format)  # cell B2



temp="grid_item--link"
page = Nokogiri::HTML(open(loc1))   
puts "Loading"
news_links = page.css("a").select{|link| link['class'] == temp}
news_links.each{|link| puts link['href'] 
worksheet.write(0, counter,cell<<" "<<counter.to_s, format)  # cell B2

worksheet.write(add_link_2, counter,link['href'], format) 
cell = "RELATED CONTENT"
counter +=1
}



add_link=1
add_link_2+=1
counter=1
end
# write to file
workbook.close