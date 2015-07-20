class Mailer < ApplicationMailer
	default from: "buyby.au@gmail.com"

	def send_new_offer_notification_mail(user,request,subject)
		@user=user
		@request=request
		mail(to: @user.email, subject: subject)
	end
end
