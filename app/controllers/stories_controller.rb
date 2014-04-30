class StoriesController < ApplicationController

	# we want to add a list of all of the stories 
	#in startic website this is the index html
	def index
		
		# i want to pass some data to our html
		#this data may change so its variable
		#so we store the data in a ruby thing called a variable
		@username = "lizzy"


		#we want to store some stories in a list
		#in ruby we call this an array
		#@stories = ["google", "facebook", "twitter", "linkedIn"]

		#instead we want to get the real stories from the database
		@stories = Story.all
	end



	def show
		#read more page!!!! CHIPPY TO SEE DETAIL (PRICE DESCRIPTION ECC) OF ONE ITEM 
		#prams get extra info from forms and urls
		@story = Story.find(params[:id])
	end






	def new 
		#this is our new story form
		@story = Story.new
	end



	def create
		#actually add things to the database
		@story = Story.new(story_params)

		# safe to the data base
		if @story.save 

			#let the user know it was succesfull
			flash[:success] = "Your story was added"

			#i want to go back to the homepage adter i've saved
			redirect_to root_path
		else
			render "new"
		end
	end


	def edit
		#this is the form to edit the story
		@story = Story.find(params[:id])
	end


	def update
		#this is actually updating the database using form data
		@story = Story.find(params[:id])

		#update this story based in the form data
		if @story.update(story_params)

			#let the user know again they were sucessfull
			flash[:success] = "you have added this story"

			#go back to the individual page
			redirect_to story_path(@story)
		else
			render "edit"
		end
	end

	def destroy
		#actually delete the story from the database
		@story = Story.find(params[:id])

		#remove from database
		@story.destroy 

		#let the user know again they were sucessfull
		flash[:success] = "you have deleted this story"

		#redirect back to the homepage
		redirect_to root_path
	end


	def story_params
		#find the data from the form
		params.require(:story).permit(:title, :description, :link)
	end

end


















