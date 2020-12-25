class CommentsController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.create username: current_user.name, body: params[:comment][:body]
    redirect_to post_path(@post)
  end

  def destroy
    return render file: Rails.root.join('/public/404.html'), status: :not_found unless Post.exists?(params[:post_id]) && Post.find(params[:post_id]).comments.exists?(params[:id])

    @post = Post.find(params[:post_id])
    @comment = @post.comments.find(params[:id])
    @comment.destroy
    redirect_to @post
  end

  def edit
    return render file: Rails.root.join('/public/404.html'), status: :not_found unless Post.exists?(params[:post_id]) && Post.find(params[:post_id]).comments.exists?(params[:id])

    @post = Post.find(params[:post_id])
    @comment = @post.comments.find(params[:id])
  end

  def update
    return render file: Rails.root.join('/public/404.html'), status: :not_found unless Post.exists?(params[:post_id]) && Post.find(params[:post_id]).comments.exists?(params[:id])

    @post = Post.find(params[:post_id])
    @comment = @post.comments.find(params[:id])
    @comment.update(comment_params) ? (redirect_to @post) : (render 'edit')
  end
    private

    def comment_params
      params.require(:comment).permit(:body)
    end
end
