# Preview all emails at http://localhost:3000/rails/mailers/mailer
class MailerPreview < ActionMailer::Preview
	def sample_mail_preview
    	Mailer.send_new_offer_notification_mail(User.first,User.first.requests.first,'test')
  	end
	
	def new_request_mail_preview
    	Mailer.send_new_request_notification_mail(User.first,User.first.requests.first,'test')
  	end

  	def offer_mail_preview
    	Mailer.send_my_offer_notification_mail(User.first,User.first.offers.first,'test',true)
  	end
end
