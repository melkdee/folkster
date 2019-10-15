class ListingsController < ApplicationController
	include Pagy::Backend

	def index
		@pagy, @listings = pagy(Listing.all, page: params[:page], items: 3)
	end
end
