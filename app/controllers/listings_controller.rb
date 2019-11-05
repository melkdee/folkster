class ListingsController < ApplicationController
	#2019-10-22; Restrict actions to logged in users
	before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
	
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
		@listing = current_user.listings.create(listing_params)
		if @listing.valid?
		redirect_to root_path
		else
		render :new, status: :unprocessable_entity
		end
	end

	#2019-10-23, "Add the Listing details page" (@listing)
	#2019-11-04, "Add ability to comment"
	#2019-11-05 "Allow photo uploads"
	def show
		@listing = Listing.find(params[:id])
		@comment = Comment.new
		@photo = Photo.new
	end

	#2019-10-24, "Add edit place page"
	def edit
		@listing = Listing.find(params[:id])

		if @listing.user != current_user
    	return render plain: 'Not Allowed Dude', status: :forbidden
  		end
	end

	#2019-10-24 Update
	def update
		@listing = Listing.find(params[:id])

		#restrict to user that created listing id
		if @listing.user != current_user
    		return render plain: 'Not Allowed Dude', status: :forbidden
  		end

  		@listing.update_attributes(listing_params)
  			if @listing.valid?
  				redirect_to root_path
  			else
  				render :edit, status: :unprocessable_entity
  			end
	end

	#2019-10-24 Remove ('destroy') Listing
	def destroy
		@listing = Listing.find(params[:id])

		 if @listing.user != current_user
    	return render plain: 'Not Allowed Man', status: :forbidden
  			end

  		@listing.destroy
  		redirect_to root_path
	end

	private

	def listing_params
		params.require(:listing).permit(:name, :description, :address)
	end
end
