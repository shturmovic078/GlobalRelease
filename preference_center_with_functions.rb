require 'watir-webdriver'
require 'webdriver-user-agent'
require 'csv'
require 'watir-scroll'
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


def check_blank
 	browser.button(:type => 'submit').click
	browser.screenshot.save "Login/#{"Blank submission"}_"<<counter.to_s<<".png"
	counter+=1
end


csv_text = File.read('register.csv')
csv = CSV.parse(csv_text, :headers => true)
csv.each do |row|  
sleep 4
loc1= "#{row['url']}"
#loc2= "#{row['product']}"
#loc3= "#{row['type']}"
#loc4= "#{row['count']}"
sleep 1
counter+=1
browser.goto loc1
puts loc1
sleep 1
puts counter
puts browser.title


puts "About to check for blanks"<<check_blank.to_s


end

