require 'rubygems'
require 'watir'
require 'csv'
require 'watir-scroll'
include Selenium

caps = WebDriver::Remote::Capabilities.new
caps['browser'] = 'Chrome'
caps['browser_version'] = '55.0'
caps['os'] = 'Windows'
caps['os_version'] = '7'
caps['resolution'] = '1024x768'
caps["browserstack.debug"] = "true"
caps["browserstack.local"] = "true"

browser = Watir::Browser.new(:remote,
  :url => "http://zaqwsx1:Fs54nwmULt7BaSTosZxi@hub-cloud.browserstack.com/wd/hub",
  :desired_capabilities => caps)



csv_text = File.read('dawn_list.csv')
csv = CSV.parse(csv_text, :headers => true)
csv.each do |row|  
sleep 4
loc1= "#{row['url']}"


browser.goto loc1

counter=0



if browser.select_list(:id=> 'phdesktopbody_0_phdesktopproductprimarycontentarea_0_ProductVariantsLeft1_ddlVariantionSelectorLeft').exists?
   puts "Drop Down found"

size = browser.select_list(:id=> 'phdesktopbody_0_phdesktopproductprimarycontentarea_0_ProductVariantsLeft1_ddlVariantionSelectorLeft').options.count
sleep 5
puts size
puts browser.title<<" has "<< size <<" options to choose from"


browser.select_list(:id=> 'phdesktopbody_0_phdesktopproductprimarycontentarea_0_ProductVariantsLeft1_ddlVariantionSelectorLeft').options.each do |opt|
p opt.text
p opt.value<< "SKU Found"
browser.select_list(:id=> 'phdesktopbody_0_phdesktopproductprimarycontentarea_0_ProductVariantsLeft1_ddlVariantionSelectorLeft').select opt.text
sleep 5
#puts browser.select(:id=> 'phdesktopbody_0_phdesktopproductprimarycontentarea_0_ProductVariantsLeft1_ddlVariantionSelectorLeft').opt.value<< " SKU found"

browser.scroll.to :center
sleep 7
puts "About to click on Buy Now "
sleep 6
browser.a(:href => /#binModal/).click
sleep 20
if browser.text.include? "To purchase this item please go directly to your preferred online retailer or visit a store near you."


opt.text.gsub!('.','_')
browser.screenshot.save  "NoItem/#{browser.title}_"<<opt.text<<".png"
browser.refresh
else 

	browser.screenshot.save  "BuyNow/#{browser.title}_"<<opt.text<<".png"
	browser.refresh
end

end

else
   puts "I can't find the drop down move to the next one"
   browser.scroll.to :center
     puts "About to click on Buy Now "
sleep 6
browser.a(:href => /#binModal/).click
sleep 7


if browser.text.include? "To purchase this item please go directly to your preferred online retailer or visit a store near you."
opt.text.gsub!('.','_')
browser.screenshot.save  "NoItem/#{browser.title}_"<<" No Size"<<".png"
browser.refresh
else 

	browser.screenshot.save  "BuyNow/#{browser.title}_"<<" No Size"<<".png"
	browser.refresh
end
end








end



browser.quit