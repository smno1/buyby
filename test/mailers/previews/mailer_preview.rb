# Preview all emails at http://localhost:3000/rails/mailers/mailer
class MailerPreview < ActionMailer::Preview
	def sample_mail_preview
    	Mailer.send_new_offer_notification_mail(User.first,User.first.requests.first,'test')
  	end
end
