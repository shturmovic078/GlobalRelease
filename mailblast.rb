
require "watir"
require "net/smtp"
require "mail"
require "gmail"
#=> true



puts "I'm about to send email"







options = { :address              => "smtp.gmail.com",
            :port                 => 587,
            :domain               => 'gmail.com',
            :user_name            => 'publicisteam@gmail.com',
            :password             => '1675team',
            :authentication       => 'login',
            :enable_starttls_auto => true

          }




Mail.defaults do
  delivery_method :smtp, options
end


Mail.deliver do
  from 'publicisteam@gmail.com'
       to 'publicisqa1@yahoo.com,publicisteam@gmail.com,albertgolubev@gmail.com,publicisqa@outlook.com'
      

       
  subject 'ECRM-28 Email Test'
  content_type 'text/html; charset=UTF-8'
  body   File.read('template.txt')
end


#Twitter.update("I'm tweeting with @gem!")

#=> "<meta xmlns=\"http://www.w3.org/1999/xhtml\" content=\"text/html; charset=UTF-8\" http-equiv=\"content-type\" />"