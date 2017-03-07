require 'watir'
require 'csv'
 browser = Watir::Browser.new :firefox



browser.goto "https://www.redlobster.com/images/default-source/Headers/lunch-item-detail-page-header_1800x614.jpg?sfvrsn=0&size=1125"

def save(path)
    @container.goto(src)
     begin
      fill_save_image_dialog(path)
      @container.document.execCommand("SaveAs")
     ensure
      @container.back
     end
    end