class ListingsController < ApplicationController
	include Pagy::Backend

	def index
		@pagy, @listings = pagy(Listing.all, page: params[:page], items: 3)
	end

	# 2019-10-17, "Add New Listing"
	def new
	end
end
