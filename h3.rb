require 'nokogiri'    
require 'open-uri'


doc = Nokogiri::HTML(open("http://www.garnierusa.com/products/skincare/micellar-cleansing-water/micellar-cleansing-water/micellar-cleansing-water-all-in-1-mattifying.aspx"))


doc.css('h3.standard_header').each do |header|           
  puts header.text


  puts "- - - - - - - - - -"
		
		doc.css('.carousel-product').each do |link|   

			
        puts link.text.split.join(" ")
        
    end
end
