class PostsController < ApplicationController

	def index
		@posts = Post.all
	end

	def show
		@post = Post.find(params[:id])
	end

	def new
		@post = Post.new
	end

	def create
		@post = Post.new(post_params)
		if @post.save
			redirect_to @post, success: 'Статья успешно создана'
		else
			render 'new', danger: 'Статья не создана'
		end
	end

	def edit
		@post = Post.find(params[:id])
	end

	def update
		@post = Post.find(params[:id])
		if @post.update_attributes(post_params)
			redirect_to @post, success: 'Cтaтья успешно обновлена'
		else
			render 'new', danger: 'Статья не обновлена'
		end
	end

	def destroy
		@post = Post.find(params[:id])
		@post.destroy
		redirect_to posts_path, success: 'Статья успешно удалена'
	end

	private

	def post_params
		params.require(:post).permit(:title, :summary, :body, :image, :all_tags)
	end
end
