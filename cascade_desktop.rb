require 'rubygems'
require 'watir'
require 'csv'
include Selenium
require 'watir-scroll'
caps = WebDriver::Remote::Capabilities.new
caps['browser'] = 'IE'
caps['browser_version'] = '11.0'
caps['os'] = 'Windows'
caps['os_version'] = '7'
caps['resolution'] = '1024x768'
caps["browserstack.debug"] = "true"
caps["browserstack.local"] = "true"

browser = Watir::Browser.new(:remote,
  :url => "http://zaqwsx1:Fs54nwmULt7BaSTosZxi@hub-cloud.browserstack.com/wd/hub",
  :desired_capabilities => caps)



csv_text = File.read('cascade_list.csv')
csv = CSV.parse(csv_text, :headers => true)
csv.each do |row|  
sleep 4
loc1= "#{row['url']}"


browser.goto loc1

counter=0









sleep 2




if browser.select_list(:id=> 'phdesktopbody_0_phdesktopproductprimarycontentarea_0_ProductVariantsLeft1_ddlVariantionSelectorLeft').exists?
 	puts "Drop Down found"

  		browser.select_list(:id=> 'phdesktopbody_0_phdesktopproductprimarycontentarea_0_ProductVariantsLeft1_ddlVariantionSelectorLeft').options.each do |opt|
					p opt.text
					browser.select_list(:id=> 'phdesktopbody_0_phdesktopproductprimarycontentarea_0_ProductVariantsLeft1_ddlVariantionSelectorLeft').select opt.text
					sleep 5
					
					puts loc1
					browser.link(:href, /#binModal/).click

					sleep 8

							if browser.text.include? "To purchase this item please go directly to your preferred online retailer or visit a store near you."

									browser.screenshot.save  "CascadeNoItem/#{browser.title}_"<<Array.new(32){rand(36).to_s(36)}.join<<".png"

									else 

									browser.screenshot.save  "CascadeBuyNow/#{browser.title}_"<<Array.new(32){rand(36).to_s(36)}.join<<".png"


							end
							puts "Click on Close"
							browser.refresh 
							sleep 10



	
	
end


end


end

browser.quit