class PostsController < ApplicationController
  def index
    @post = Post.all
  end

  def new
    @post = Post.new
  end

  def show
    unless Post.exists?(params[:id])
      render file: Rails.root.join('/public/404.html'), status: :not_found
      return
    end
    @post = Post.find(params[:id])
  end

  def edit
    unless Post.exists?(params[:id])
      render file: Rails.root.join('/public/404.html'), status: :not_found
      return
    end
    @post = Post.find(params[:id])
  end

  def update
    unless Post.exists?(params[:id])
      render file: Rails.root.join('/public/404.html'), status: :not_found
      return
    end
    @post = Post.find(params[:id])

    if @post.update(post_params)
      redirect_to @post
    else
      render 'edit'
    end
  end

  def create
    @post = Post.new(post_params)

    if @post.save
      redirect_to @post
    else
      render 'new'
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :body)
  end
end
