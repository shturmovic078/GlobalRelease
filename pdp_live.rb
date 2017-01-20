require 'rubygems'
require 'watir-webdriver'

include Selenium

caps = WebDriver::Remote::Capabilities.new
caps[:browserName] = 'android'
caps[:platform] = 'ANDROID'
caps['device'] = 'Samsung Galaxy S5'
caps["browserstack.debug"] = "true"

browser = Watir::Browser.new(:remote,
  :url => "http://zaqwsx1:Fs54nwmULt7BaSTosZxi@hub-cloud.browserstack.com/wd/hub",
  :desired_capabilities => caps)

browser.goto "http://dawn-dish.com/en-us/products/by-line/original-scents"

browser.screenshot.save "n.png"
puts browser.title
browser.quit