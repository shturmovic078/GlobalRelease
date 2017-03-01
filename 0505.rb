require 'rubygems'
require 'watir-webdriver'

include Selenium

caps = WebDriver::Remote::Capabilities.new
caps[:os] = "Windows"
caps[:name] = "Watir WebDriver"
caps[:browser] = "firefox"
caps[:browser_version] = "20"
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
b.goto loc1
sleep 5
url_return = b.url
puts  url_return

if (loc2!=url_return)
	puts count
	puts "Found a mismatch  for column B "<<loc2<<" and "<<url_return
	count+=1;



end

end
