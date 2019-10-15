Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  #2019-10-14: Setting up 'listings controller'
  	#FAQ: This is how our app knows where to go to find/display info
  	#IN THIS CASE: app>views> [listings;index]
  root 'listings#index'
end
