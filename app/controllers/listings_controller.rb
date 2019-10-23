class ListingsController < ApplicationController
	#2019-10-22; Restrict actions to logged in users
	before_action :authenticate_user!, only: [:new, :create]
	
	#2019-10-10; add pagination
	include Pagy::Backend

	def index
		@pagy, @listings = pagy(Listing.all, page: params[:page], items: 3)
	end

	# 2019-10-17, "Add New Listing PAGE"
	def new
		@listing = Listing.new
	end

	#2019-10-17, "Adding a new Listing to DATABASE"
	def create 
		current_user.listings.create(listing_params)
		redirect_to root_path
	end

	private

	def listing_params
		params.require(:listing).permit(:name, :description, :address)
	end
end
