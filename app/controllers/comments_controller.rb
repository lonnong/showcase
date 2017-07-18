class CommentsController < ApplicationController
	before_action :find_comment, only: [:show, :edit, :update, :destroy]
	before_action :authenticate_user!

	def new
		@comment = Comment.new
	end

	def create
		@post = Post.find(params[:post_id])
		@comment = Comment.create(params[:comment].permit(:content))
		@comment.user_id = current_user.id
		@comment.post_id = @post.id

		if @comment.save
			redirect_to @post 
		else
			render 'new'
		end

	end

	def destroy
	end

	def edit
	end

	def update
	end

	private

	def params_comment
		params.require(:comment).permit(:content)
	end

	def find_comment
		@comment = Comment.find(params[:id])
	end
end
