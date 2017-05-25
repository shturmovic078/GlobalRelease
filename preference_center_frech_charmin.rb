#Albert Golubev


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

counter=1

csv_text = File.read('register_french.csv')
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

browser.link(:href, "/fr-ca/page-connexion*").click

browser.screenshot.save  "Login/#{"Login_Page"}_"<<counter.to_s<<".png"
puts "Go to next line or stop"
counter+=1

sleep 4


browser.a(:id =>/phdesktopbody_0_RegisterLink*/).when_present.click
sleep 4
browser.text_field(:name => 'phdesktopbody_0$username').set 'albert.golubev@pkt.com'
sleep 4
browser.text_field(:name => 'phdesktopbody_0$zipcode').set '11235'


browser.button(:type => 'submit').click
browser.screenshot.save "Login/#{"About to submit"}_"<<counter.to_s<<".png"
counter+=1
#browser.div(:name => 'phdesktopbody_0$LoginSubmitBtn').click
#browser.div(:class=> 'btn add-to-cart-detail').click                  
                
sleep 4

browser.screenshot.save "Login/#{"About to submit"}_"<<counter.to_s<<".png"
browser.text_field(:name => 'phdesktopbody_0$password').set 'zaq12wsx'
sleep 4
browser.screenshot.save "Login/#{"About to submit 2"}_"<<counter.to_s<<".png"
counter+=1
browser.button(:type => 'submit').click

browser.screenshot.save "Login/#{"About to submit 3"}_"<<counter.to_s<<".png"
counter+=1
sleep 4

browser.text_field(:name => 'phdesktopbody_0$username').set 'albert.golubev@pkt.com'

browser.text_field(:name => 'phdesktopbody_0$password').set 'zaq12wsx'
sleep 4
browser.button(:type => 'submit').click
sleep 4
browser.screenshot.save "Login/#{"About to submit 4"}_"<<counter.to_s<<".png"
sleep 4
counter+=1
browser.a(:id =>/HlinkEdit*/).when_present.click
sleep 2
browser.screenshot.save "Login/#{"About to submit 6"}_"<<counter.to_s<<".png"
sleep 2
counter+=1
#browser.a(:id =>'phdesktopbody_0_HlinkEdit').when_present.click
sleep 2
browser.text_field(:name => 'phdesktopbody_0$grs_consumer[firstname]').set ''

browser.text_field(:name => 'phdesktopbody_0$grs_consumer[lastname]').set ''

browser.text_field(:name => 'phdesktopbody_0$grs_account[emails][0][address]').set ''

browser.text_field(:name => 'phdesktopbody_0$grs_account[addresses][0][postalarea]').set ''

browser.button(:type => 'submit').click

browser.screenshot.save "Login/#{"About to submit blank"}_"<<counter.to_s<<".png"
sleep 4
counter+=1



counter+=1
sleep 2

browser.a(:id =>/LogOffLink*/).when_present.click

browser.screenshot.save "Login/#{"About to submit logout"}_"<<counter.to_s<<".png"
counter+=1
end