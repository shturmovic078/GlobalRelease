#Albert Golubev
require 'rubygems'
require 'csv'
require 'rubygems'
require 'watir-webdriver'

#require 'mechanize'



include Selenium

caps = WebDriver::Remote::Capabilities.new
caps['browser'] = 'Chrome'
caps['browser_version'] = '55.0'
caps['os'] = 'OS X'
caps['os_version'] = 'Sierra'
caps['resolution'] = '1024x768'
caps["browserstack.debug"] = "true"

browser = Watir::Browser.new(:remote,
  :url => "http://zaqwsx1:Fs54nwmULt7BaSTosZxi@hub-cloud.browserstack.com/wd/hub",
  :desired_capabilities => caps)
browser.goto 'https://issues.nurun.com/secure/admin/EditCustomFieldOptions!default.jspa?fieldConfigId=10433&currentOptions=1'
counter = 0

puts "30 to load"
sleep 30
csv_text = File.read('list.csv')
csv = CSV.parse(csv_text, :headers => true)
csv.each do |row|  
sleep 4
loc1= "#{row['url']}"
#loc2= "#{row['product']}"
#loc3= "#{row['type']}"
#loc4= "#{row['count']}"
sleep 25
puts "15 to login"
counter+=1
puts loc1
sleep 1
puts counter

 
    browser.button(:name, "addValue").clear
    sleep 3
    browser.text_field(:name, "addValue").set loc1
    sleep 3
    browser.button(:id, "add_submit").click



end