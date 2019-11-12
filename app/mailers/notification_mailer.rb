class NotificationMailer < ApplicationMailer
	default from: "no-reply@folkster.com"

	def comment_added(comment)
		@listing = comment.listing
		@listing_owner = @listing.user

		mail(to: @listing_owner.email,
		 #mail(to: "melkdee.designs@gmail.com",
         subject: "A comment has been added to #{@listing.name}")
  	end
end
