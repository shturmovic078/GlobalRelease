require 'rubygems'
require 'watir-webdriver'
require 'csv'
include Selenium

caps = WebDriver::Remote::Capabilities.new
caps['browser'] = 'IE'
caps['browser_version'] = '11.0'
caps['os'] = 'Windows'
caps['os_version'] = '7'
caps['resolution'] = '1024x768'
caps["browserstack.debug"] = "true"

browser = Watir::Browser.new(:remote,
  :url => "http://zaqwsx1:zqybk75kc8SQJmSXFKvg@hub-cloud.browserstack.com/wd/hub",
  :desired_capabilities => caps)

csv_text = File.read('lobster_list.csv')
csv = CSV.parse(csv_text, :headers => true)
sleep 7 


  
csv.each do |row|  
sleep 4
loc1= "#{row['url']}"

browser.goto loc1
sleep 5

puts browser.title
#browser.screenshot.save  browser.title<<"initial_load"<<".png"


browser.element(:css => "#slick-slide01 > button[type=\"button\"]").click
sleep 5
browser.screenshot.save  browser.title<<"slide01"<<".png"


browser.element(:css => "#slick-slide00 > button[type=\"button\"]").click
sleep 5
browser.screenshot.save  browser.title<<"slide00"<<".png"

browser.element(:css => "#slick-slide11 > button[type=\"button\"]").click
sleep 5
browser.screenshot.save  browser.title<<"slide11"<<".png"


browser.element(:css => "#slick-slide12 > button[type=\"button\"]").click
sleep 5
browser.screenshot.save  browser.title<<"slide12"<<".png"


browser.element(:css => "#slick-slide13 > button[type=\"button\"]").click
sleep 5
browser.screenshot.save  browser.title<<"slide13"<<".png"


browser.element(:css => "#slick-slide14 > button[type=\"button\"]").click
sleep 5
browser.screenshot.save  browser.title<<"slide14"<<".png"



browser.element(:css => "#slick-slide15 > button[type=\"button\"]").click
sleep 5
browser.screenshot.save  browser.title<<"slide15"<<".png"

end 
browser.quit