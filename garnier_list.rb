require 'nokogiri'
require 'open-uri'
require 'rubygems'
require 'csv'
require 'writeexcel'  
workbook = WriteExcel.new('5links.xls')
worksheet  = workbook.add_worksheet

format = workbook.add_format
video_line="stop"



worksheet.write(0, 0, 'Product Details Link', format)
worksheet.write(0,1 , 'Product Line', format)
worksheet.write(0,2, 'Related Products', format)
counter1=1
counter2=1
counter3=1
csv_text = File.read('temp1.csv')
csv = CSV.parse(csv_text, :headers => true)
csv.each do |row|  
sleep 4
loc1= "#{row['url']}"


 #Get the product url
 puts "Output URL"
  worksheet.write("A"<<counter1.to_s,loc1) 
  sleep 2
  puts "Output URL on cell "<<counter1.to_s
  counter1+=1


page = Nokogiri::HTML(open(loc1))   
puts "Loading"
sleep 15
news_links = page.css("a").select{|link| link['class'] == "grid_item--link"}
news_links.each{|link| puts link['href'] 
 
 
  #Get all the product line
  if (link['href'].include? "products") 
   if (video_line.include? "stop") 
    type = "product line" 
    product_line="found"
    puts "Found Content 1st loop"
    puts "Product name is "<<link.text
   
     
   #puts link['href'] 


  
  worksheet.write("B"<<counter2.to_s,link['href'], format) 
   counter1+=1



     end

 end

  if (link['href'].include? "/article") 
	
    video_line='video_content'
     puts "Found Content 2nd loop"
    #worksheet.write("C"<<counter3.to_s,link['href'].split.join(" "), format) 
    counter2+=1
 end

if (video_line.include? "video_content")
    if (link['href'].include? "products") 
  	
  		  puts "Found Content 3rd loop"
  		  type = "related products"

        


  worksheet.write("C"<<counter3.to_s,link['href'] , format) 
       counter3+=1
    


 
    
  		 
  end
  end


}
  video_line = "stop"
 
  m =[counter1.to_i,counter2.to_i,counter3.to_i].max
  counter1+=m.to_i+1
  counter2+=m.to_i+1
  counter3+=m.to_i+1
  
end






workbook.close

