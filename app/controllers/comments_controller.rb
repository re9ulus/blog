class CommentsController < ApplicationController
	before_filter :get_post

	def get_post
		@post = Post.find(params[:post_id])
	end

	def show
		@comment = @post.comments.find(params[:id])
	end

	def index
		@comments = @post.comments
	end

	def create
		@comment = @post.comments.new(params[:comment])

		respond_to do |format|
			if @comment.save
				format.html { redirect_to @post, notice: 'Comment added.' }
				format.json { render json: [@post, @comment], status: :created, location: [@post, @comment]}
			else
				format.html { render action: "new" }
				format.json { render json: @comment.errors, status: :unprocessable_entity }
			end
		end
	end
end
