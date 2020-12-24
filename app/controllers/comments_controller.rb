class CommentsController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    # @comments.username = current_user.name
    # p comment_params
    @comment = @post.comments.create(comment_params)
    # p '123123123' + comments.to_s
    redirect_to post_path(@post)
  end

  private

  def comment_params
    # name = current_user.name
    params.require(:comment).permit(:username, :body)
  end
end
