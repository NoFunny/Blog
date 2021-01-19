class PostsController < ApplicationController
  load_and_authorize_resource unless Rails.env.test?

  def index
    @post = Post.all
  end

  def new
    @post = Post.new
  end

  def show
    return render file: Rails.root.join('/public/404.html'), status: :not_found unless Post.exists?(params[:id])
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    @post.update(post_params) ? (redirect_to @post) : (render 'edit')
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to posts_path
  end

  def create
    @post = Post.new(post_params)
    @post.rating = 0
    @post.save ? (redirect_to @post) : (render 'new')
  end

  def add_rating; end

  private

  def post_params
    params.require(:post).permit(:title, :body)
  end
end
