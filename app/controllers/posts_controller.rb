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

  def create
    @post = Post.new(post_params)
    @post.save ? (redirect_to @post) : (render 'new')
  end

  private

  def post_params
    params.require(:post).permit(:title, :body)
  end
end
