#Albert Golubev


require 'watir-webdriver'
require 'csv'
#require 'mechanize'

include Selenium

caps = WebDriver::Remote::Capabilities.new
caps[:os] = "Windows"
caps[:name] = "Watir WebDriver"
caps[:browser] = 'IE'
caps[:browser_version] = '11.0'
caps['os'] = 'Windows'
caps['os_version'] = '7'
caps['resolution'] = '1024x768'
caps["browserstack.debug"] = "true"

browser = Watir::Browser.new(:remote,
  :url => "http://zaqwsx1:Fs54nwmULt7BaSTosZxi@hub-cloud.browserstack.com/wd/hub",
  :desired_capabilities => caps)

counter=1

csv_text = File.read('temp12.csv')
csv = CSV.parse(csv_text, :headers => true)
csv.each do |row|  
sleep 4
loc1= "#{row['url']}"
#loc2= "#{row['product']}"
#loc3= "#{row['type']}"
#loc4= "#{row['count']}"
sleep 1
counter-=1
browser.goto loc1
puts loc1
sleep 1
puts counter
puts browser.title



browser.screenshot.save  "Oralb/#{"browser.title"}_"<<counter.to_s<<".png"
puts "Go to next line or stop"
sleep 3


end