class CommentsController < ApplicationController

	def new
		@story = Story.find(params[:story_id])
		@comment = @story.comments.new
	end

	def create
		@story = Story.find(params[:story_id])
		@comment = @story.comments.new(comment_params)

		if @comment.save
			flash[:success] = "Youve added a comment"
			redirect_to story_path(@story)
		else
			render "new"
		end

	end

	def comment_params
		params.require(:comment).permit(:body)
	end



end
