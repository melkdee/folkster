class CommentsController < ApplicationController
	#2019-11-04 Add Create Comments action, Require User to be logged in
	before_action :authenticate_user!
	def create
		@listing = Listing.find(params[:listing_id])
		@listing.comments.create(comment_params.merge(user: current_user))
		redirect_to listing_path(@listing)
	end

	private

	  def comment_params
	    params.require(:comment).permit(:message, :rating)
	  end

end
