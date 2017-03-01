require 'mechanize'
require 'net/http'
require 'uri'
require 'writeexcel'
require 'csv'
require 'rubygems'


workbook = WriteExcel.new('links_garnier_status_1.xls')
counter2=2
# Add worksheet(s)
worksheet  = workbook.add_worksheet
one=1
counter=2
# Add and define a format
format = workbook.add_format
format.set_bold
format.set_color('black')
format.set_align('left')


worksheet.write("A"<<"1","Starting page",format) 

worksheet.write("B"<<one.to_s,"Page Link",format) 

worksheet.write("C"<<one.to_s,"Redirect Type",format) 

csv_text = File.read('all_pdp.csv')
csv = CSV.parse(csv_text, :headers => true)
csv.each do |row|  
sleep 4
loc1= "#{row['url']}"

       puts loc1


agent = Mechanize.new
page = agent.get(loc1)
puts "About to write to A2 Cell"
worksheet.write("A"<<counter.to_s,loc1.to_s) 
page.links_with(:href => /^https?/).each do |link|


			
	 puts link.href

     if link.href.eql? "http://www.garnierchina.com/_zh/_cn/Home.aspx"

     	puts "Bad URL "<<link.href
     
    

      else
     	res = Net::HTTP.get_response(URI.parse(URI.encode(link.href.to_s)))
 
  puts res.code





  worksheet.write("B"<<counter.to_s,link.href) 

worksheet.write("C"<<counter.to_s,res.code) 

counter +=1

end
end



end
workbook.close