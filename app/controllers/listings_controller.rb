class ListingsController < ApplicationController
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
		Listing.create(listing_params)
		redirect_to root_path
	end

	private

	def listing_params
		params.require(:listing).permit(:name, :description, :address)
	end
end
