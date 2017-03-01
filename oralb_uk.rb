#!/usr/bin/ruby
require 'nokogiri'    
require 'open-uri'
require 'writeexcel' 
require 'rubygems'
require 'watir'
require 'csv'

include Selenium
counter=0;


#setup browserstack instance
caps = WebDriver::Remote::Capabilities.new
caps[:os] = "Windows"
caps[:name] = "Watir WebDriver"
caps['browser'] = 'IE'
caps['browser_version'] = '11.0'
caps['os'] = 'Windows'
caps['os_version'] = '7'
caps['resolution'] = '1024x768'
browser = Watir::Browser.new(:remote,
:url => "http://zaqwsx1:Fs54nwmULt7BaSTosZxi@hub-cloud.browserstack.com/wd/hub",
:desired_capabilities => caps)


#setup CSV


csv_text = File.read('oralb_uk.csv')
csv = CSV.parse(csv_text, :headers => true)
csv.each do |row|  
sleep 4
loc1= "#{row['url']}"

       puts loc1
       browser.goto loc1
       sleep 2
      
       browser.screenshot.save "Oralbuk/#{browser.title}_"<<Array.new(32){rand(36).to_s(36)}.join<<".png"
       counter+=1
       puts"Link #"<<counter.to_s
  
       
    end
