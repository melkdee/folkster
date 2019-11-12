class NotificationMailer < ApplicationMailer
	default from: "no-reply@folkster.com"

	def comment_added
		mail(to: "melkdee.designs@gmail.com",
         subject: "A comment has been added to your listing")
  	end
end
