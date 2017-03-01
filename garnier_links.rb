#!/usr/bin/ruby
require 'nokogiri'    
require 'open-uri'
require 'writeexcel' 
require 'rubygems'
require 'watir'
require 'csv'

include Selenium

#setup excel
final_url=""
counter1=1
counter2=1
workbook = WriteExcel.new('Redirectsbrow.xls')
worksheet  = workbook.add_worksheet

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


#format excel

# Add and define a format
format = workbook.add_format
format.set_bold
format.set_color('black')
format.set_align('left')

#setup CSV

worksheet.write("A"<<"1","Link",format)
worksheet.write("B"<<"1","Redirect Test",format)
worksheet.write("C"<<"1","Fimal Link",format)    
csv_text = File.read('all_pdp_garneir.csv')
csv = CSV.parse(csv_text, :headers => true)
csv.each do |row|  
sleep 4
loc1= "#{row['url']}"

       puts loc1
       browser.goto loc1
       sleep 2
       final_url=browser.url
       sleep 2
       if loc1.eql? final_url
       worksheet.write("A"<<counter1.to_s,loc1) 
       
       worksheet.write("B"<<counter1.to_s,"301 Redirect found")  
       worksheet.write("C"<<counter1.to_s,final_url)  
       browser.screenshot.save  "Redirects/#{browser.title}_"<<Array.new(32){rand(36).to_s(36)}.join<<".png"
       else
       worksheet.write("B"<<counter1.to_s,"No Redirects")  
       worksheet.write("C"<<counter1.to_s,final_url)  
       browser.screenshot.save  "Valid/#{browser.title}_"<<Array.new(32){rand(36).to_s(36)}.join<<".png"
       end 
        counter1+=1

        
       
    end








workbook.close