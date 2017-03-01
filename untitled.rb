if browser.text.include?("To purchase this item please go directly to your preferred online retailer or visit a store near you.").should == true

									browser.screenshot.save  "NoItem/#{browser.title}_"<<Array.new(32){rand(36).to_s(36)}.join<<".png"

									else 

									browser.screenshot.save  "BuyNow/#{browser.title}_"<<Array.new(32){rand(36).to_s(36)}.join<<".png"


							end












			if browser.text.include?("To purchase this item please go directly to your preferred online retailer or visit a store near you.").should == true

				browser.screenshot.save  "CascadeNoItem/#{browser.title}_"<<Array.new(32){rand(36).to_s(36)}.join<<".png"

				else 

					browser.screenshot.save  "CascadeBuyNow/#{browser.title}_"<<Array.new(32){rand(36).to_s(36)}.join<<".png"
			end



			
			if browser.select_list(:id=> 'phdesktopbody_0_phdesktopproductprimarycontentarea_0_ProductVariantsLeft1_ddlVariantionSelectorLeft').exists?
  					 puts "Drop Down found"

  					 sleep 5
					 size = browser.select_list(:id=> 'phdesktopbody_0_phdesktopproductprimarycontentarea_0_ProductVariantsLeft1_ddlVariantionSelectorLeft').options.count
					 sleep 5
		
					puts size
					puts browser.title<<" has "<< size <<" options to choose from"


					browser.select_list(:id=> 'phdesktopbody_0_phdesktopproductprimarycontentarea_0_ProductVariantsLeft1_ddlVariantionSelectorLeft').options.each do |opt|
					p opt.text

					browser.select_list(:id=> 'phdesktopbody_0_phdesktopproductprimarycontentarea_0_ProductVariantsLeft1_ddlVariantionSelectorLeft').select opt.text
					sleep 5
					browser.button(:id=>'phdesktopbody_0_phdesktopproductprimarycontentarea_0_anchrBuyNowLeft').click
					sleep 7

							
					
 		  				puts "I can't find the drop down move to the next one"
 		  				sleep 5
  			 			browser.button(:id=>'phdesktopbody_0_phdesktopproductprimarycontentarea_0_anchrBuyNowLeft').click
						sleep 7
 			end 
