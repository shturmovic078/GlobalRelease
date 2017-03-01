#!/usr/bin/ruby
require 'rubygems'
require 'nokogiri'   
require 'open-uri'
require 'writeexcel'
require 'csv'



workbook = WriteExcel.new('15.xls')

video_line ="blank"
product_line = "blank"
temp="grid_item--link"

video_line='stop'
#setup excel 
counter=1
counter1=1
counter2=1
# Add worksheet(s)
worksheet  = workbook.add_worksheet






format = workbook.add_format
format.set_bold
format.set_color('black')
format.set_align('left')
worksheet.write(0, 0, 'Product Details Link', format)
worksheet.write(0,1 , 'Product Line', format)
worksheet.write(0,2, 'Article & Video', format)
worksheet.write(0,3, 'Related Products', format)
product_line_all = ""
video_line_all = ""
related_line_all = ""
url ="http://www.garnierusa.com/products/haircare/sleek-and-shine/shampoo/sleek-shine-shampoo-12-5oz.aspx"
puts counter 
counter1=1
counter2=1
counter3=1

csv_text = File.read('garnier_pdp.csv')
csv = CSV.parse(csv_text, :headers => true)
csv.each do |row|  
sleep 4
loc1= "#{row['url']}"


#site_wrapper > div.transporter-wrapper > div.content > div > div:nth-child(8) > div > div.carousel--carousel_box.carousel-has_copy--carousel_box > div > div.owl-stage-outer > div > div:nth-child(10) > div > a.grid_item-product--name

worksheet.write(counter,0,loc1, format) 
counter +=1
page = Nokogiri::HTML(open(loc1))   
puts "Loading"
news_links = page.css("a").select{|link| link['class'] == temp}
news_links.each{|link| 
	#puts link['href'] 



print "Let's Look at your page "
type=""

temp = link['href']

if (temp.include? "products") 
   if (video_line.include? "stop") 
    type = "product line" 
    product_line="found"
    puts "Found Content 1st loop"
    puts "Product name is "<<link.text
   
     
   puts link['href'] 


   open(temp) do |f|
  doc = Nokogiri::HTML(f)
  l1=doc.at_css('title').text
  puts l1
  worksheet.write("B"<<counter.to_s,l1, format) 
   counter+=1
end


     end
	
 end
  count = 0
if (temp.include? "articles") 
	
    video_line='video_content'
     puts "Found Content 2nd loop"
    worksheet.write("C"<<counter1.to_s,link.text.split.join(" "), format) 
    counter1+=1
 end
 
  if (video_line.include? "video_content")
    if (temp.include? "/products/") 
  	
  		  puts "Found Content 3rd loop"
  		  type = "related products"

        open(temp) do |f|
  doc = Nokogiri::HTML(f)
  l1=doc.at_css('title').text
  puts l1
  worksheet.write("D"<<counter2.to_s,l1, format) 
       counter2+=1
    end
  		 
  end
  end


  
}

 m =[counter,counter1,counter2].max

counter=m+1
counter1=m+1
counter2=m+1

puts "Look at the next link"
end

workbook.close