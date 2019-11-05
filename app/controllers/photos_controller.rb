class PhotosController < ApplicationController
	#2019-11-05 Add Create Photos Action; Require user to be logged in
	before_action :authenticate_user!
	def create
		#figures out what my listing id is
		@listing = Listing.find(params[:listing_id])
		#links association between user and photo_id
		@listing.photos.create(photo_params.merge(user:current_user))
		#once uploaded, redirect to the current page & show it
		redirect_to listing_path(@listing)
	end

	private
		#When calling on 'photos_params' (above) allow only 'caption..etc'
		def photo_params
			params.require(:photo).permit(:caption,:picture)
		end


end
