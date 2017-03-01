require 'open-uri'
require 'writeexcel' 



workbook = WriteExcel.new('96links.xls')
worksheet  = workbook.add_worksheet

format = workbook.add_format
format.set_bold
format.set_color('green')
format.set_align('right')

url = "http://www.garnierusa.com/products/styling/sleek-and-smooth-hair-styling/smoothing-and-shine/anti-humidity-smo444othing-milk.aspx"
error=""

def test_url(url)


begin
   doc = open(url)
   error="not found"
rescue
error="found"
   puts "The request for a page at #{url} timed out...exiting."
  exit
end

end



test_url(url)
puts "Error is " <<error