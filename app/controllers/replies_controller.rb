class RepliesController < ApplicationController
  def new
    @post = Post.find(params[:post_id])
    @comment = @post.comments.find(params[:comment_id])
  end

  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.find(params[:comment_id])
    @reply = @comment.comments.create username: current_user.name, body: params[:comment][:body]
    redirect_to post_path(@post)
  end
end
