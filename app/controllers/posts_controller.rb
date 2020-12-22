class PostsController < ApplicationController
  before_action :authenticate_user!, except: %i[index show]
  before_action :set_post, only: %i[show edit update destroy]

  def index
    @posts = Post.all
  end

  def show
    commontator_thread_show(@post)
  end

  def new
    redirect_to posts_path, danger: 'У вас нет прав на создание статьи' if cannot? :manage, Post
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to @post, success: 'Статья успешно создана'
    else
      render :new, danger: 'Ошибка при создании статьи'
    end
  end

  def edit
    redirect_to posts_path, danger: 'У вас нет прав на редактирование статьи' if cannot? :manage, Post
  end

  def update
    redirect_to posts_path, danger: 'У вас нет прав на изменение статьи' if cannot? :manage, Post
    if @post.update(post_params)
      redirect_to @post, notice: 'Статья успешно изменена'
    else
      render :edit, danger: 'Ошибка при изменении статьи'
    end
  end

  def destroy
    redirect_to posts_path, danger: 'У вас нет прав на удаление статьи' and return if cannot? :manage, Post

    @post.destroy
    redirect_to posts_path, notice: 'Статья успешно удалена' and return
  end

  private

  def set_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:title, :summary, :body, :image)
  end
end
