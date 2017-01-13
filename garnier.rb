require 'nokogiri'
require 'open-uri'
require 'rubygems'

temp="grid_item--link"
page = Nokogiri::HTML(open("http://www.garnierusa.com/articles-tips/articles/skincare/meet-dr-angie-galdi.aspx"))   
puts "Loading"
news_links = page.css("a").select{|link| link['class'] == temp}
news_links.each{|link| puts link['href'] }
