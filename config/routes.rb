Rails.application.routes.draw do

	#we want the ability to be able to add edit delete stories
	#in rails there are 7 default actions
	#index show
	#new create
	#edit update
	#destroy
	resources :stories do
		resources :comments
	end

  # set up a URL for the homepage 
  root "stories#index"

  



end
