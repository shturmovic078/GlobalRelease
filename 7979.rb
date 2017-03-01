require 'rubygems'
require 'ccsv'
#!/usr/bin/ruby
require 'nokogiri'   
require 'open-uri'
require 'writeexcel'



# global setup before the loop 











Ccsv.foreach("garnier_pdp.csv") do |values|
  puts values[0]
video_line ="blank"
product_line = "blank"
temp="grid_item--link"

video_line='stop'
#setup excel 

workbook = WriteExcel.new('15.xls')
counter=1
counter1=1
counter2=1
item =1
# Add worksheet(s)
worksheet  = workbook.add_worksheet

worksheet2 = workbook.add_worksheet




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
worksheet.write(counter,0,values[0], format) 
counter +=1
page = Nokogiri::HTML(open(values[0]))   
puts "Loading"
news_links = page.css("a").select{|link| link['class'] == temp}

news_links.each{|link| 


	#Product Line
puts "View item # "<< item.to_s
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



 # Articles and Videos


 if (temp.include? "/articles") 
	
    video_line='video_content'
     puts "Found Content 2nd loop"
    worksheet.write("C"<<counter1.to_s,link.text.split.join(" "), format) 
    counter1+=1

 end


 # Related Products



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
       puts "Max number is "<<counter2.to_s
    end
  		 
  end
  end


  
}



m = [counter.to_i,counter2.to_i].max


puts "Max is "<<m.to_s

counter=m.to_i+2
counter1=m.to_i+2
counter2=m.to_i+2


item+=1
workbook.close
end


