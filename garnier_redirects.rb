require "selenium-webdriver"
require "csv"
require "watir"
include Selenium
caps = WebDriver::Remote::Capabilities.new
caps['browser'] = 'IE'
caps['browser_version'] = '11.0'
caps['os'] = 'Windows'
caps['os_version'] = '7'
caps['resolution'] = '1024x768'
caps["browserstack.debug"] = "true"

browser = Watir::Browser.new(:remote,
  :url => "http://zaqwsx1:Fs54nwmULt7BaSTosZxi@hub-cloud.browserstack.com/wd/hub",
  :desired_capabilities => caps)

csv_text = File.read('canoe.csv')
csv = CSV.parse(csv_text, :headers => true)
sleep 7 


  
csv.each do |row|  
sleep 4
loc1= "#{row['url_final']}"
#loc2= "#{row['url_new']}"
browser.goto loc1
sleep 5
url_return = browser.url
puts  url_return

if (loc1!=url_return)
	puts count
	puts "Found a mismatch  for column B "<<loc1<<" and "<<url_return
	count+=1;



end

end