require 'mechanize'
require 'net/http'
require 'uri'
require 'writeexcel'
require 'csv'
require 'rubygems'


workbook = WriteExcel.new('links_garnier_status_1.xls')
counter=0
# Add worksheet(s)
worksheet  = workbook.add_worksheet


# Add and define a format
format = workbook.add_format
format.set_bold
format.set_color('black')
format.set_align('left')




agent = Mechanize.new
page = agent.get('http://www.garnierusa.com/products/hair-care.aspx')

page.links_with(:href => /^https?/).each do |link|


			
	 puts link.href

     if link.href.index(':80')!= nil

     	puts "Found a bad URL "<< link.href

     else 
	res = Net::HTTP.get_response(URI.parse(URI.encode(link.href.to_s)))
 
  puts res.code


  worksheet.write(0, counter,link.href, format) 

worksheet.write(1, counter,res.code, format) 
cell = "RELATED CONTENT"
counter +=1

end
end
workbook.close