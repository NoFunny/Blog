class VotesController < ApplicationController
  def inc_rating
    @post = Post.find(params[:id])
    unless @post.votes.exists?(params[:user_id])
      @post.update(rating: @post.rating + 1)
      @post.votes.new(user_id: params[:user_id]).save
    end
    redirect_to @post
  end

  def dec_rating
    @post = Post.find(params[:id])
    unless @post.votes.exists?(params[:user_id])
      @post.update(rating: @post.rating - 1)
      @post.votes.new(user_id: params[:user_id]).save
    end
    redirect_to @post
  end
end
