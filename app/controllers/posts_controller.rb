class PostsController < ApplicationController
  load_and_authorize_resource

  def index
    @post = Post.all
  end

  def new
    @post = Post.new
  end

  def show
    return render file: Rails.root.join('/public/404.html'), status: :not_found unless Post.exists?(params[:id])

    @post = Post.find(params[:id])
  end

  def edit
    return render file: Rails.root.join('/public/404.html'), status: :not_found unless Post.exists?(params[:id])

    @post = Post.find(params[:id])
  end

  def update
    return render file: Rails.root.join('/public/404.html'), status: :not_found unless Post.exists?(params[:id])

    @post = Post.find(params[:id])
    @post.update(post_params) ? (redirect_to @post) : (render 'edit')
  end

  def destroy
    return render file: Rails.root.join('/public/404.html'), status: :not_found unless Post.exists?(params[:id])

    @post = Post.find(params[:id])
    @post.destroy
    redirect_to posts_path
  end

  def inc_rating
    @post = Post.find(params[:id])
    # p "123123123123     "+:post.to_s
    @post.update(rating: @post.rating + 1)
    # @post.update(params.require(:post).permit(:rating))
    redirect_to @post
  end

  def dec_rating
    @post = Post.find(params[:id])
    # @post.rating -= 1
    @post.update(rating: @post.rating - 1)
    redirect_to @post
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
