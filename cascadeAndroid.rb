require 'selenium-webdriver'
require "selenium/client"
caps = Selenium::WebDriver::Remote::Capabilities.android  
client = Selenium::WebDriver::Remote::Http::Default.new  
client.timeout = 480  
driver = Selenium::WebDriver.for(  
  :remote,  
  :url => "http://localhost:8080/wd/hub/",  
  :http_client => client,  
  :desired_capabilities => caps)  
driver.navigate.to "http://www.google.com"  
element = driver.find_element(:name, 'q')  
element.send_keys "Example google"
element.submit  
puts driver.title  
driver.quit