require 'rubygems'
require 'watir'



firefoxCap = Selenium::WebDriver::Remote::Capabilities.firefox marionette: true, firefox_binary: "/Applications/Firefox.app";
driver = Selenium::WebDriver.for :remote, desired_capabilities: firefoxCap
