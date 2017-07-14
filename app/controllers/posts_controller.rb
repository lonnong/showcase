class PostsController < ApplicationController
	before_action :find_post, only: [:show,:destroy,:edit,:update]

	def show
	end

	def index
		@posts= Post.all.order("created_at DESC")
	end

	def new
		@post = Post.new()
	end

	def create
		@post = Post.new(post_params)

		if @post.save
			redirect_to @post
		else
			render 'new'
		end
	end

	def destroy
		@post.destroy
		rendirect_to post_path
	end

	def edit
	end

	def update
		@note.update(post_param)
		redirect_to @note
	end

	private

	def find_post
		@post = Post.find(params[:id])
	end

	def post_params
		params.require(:post).permit(:title,:link,:description)
	end
end
