class CommentsController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.create :username => current_user.name, :body => params[:comment][:body]
    redirect_to post_path(@post)
  end
end
