class VotesController < ApplicationController
  def inc_rating
    @post = Post.find(params[:id])
    vote = @post.votes.where(user_id: params[:user_id])
    if vote.size == 0
      @post.update(rating: @post.rating + 1)
      @post.votes.create user_id: params[:user_id]
    end
    redirect_to @post
  end

  def dec_rating
    @post = Post.find(params[:id])
    vote = @post.votes.where(user_id: params[:user_id])
    if vote.size == 0
      @post.update(rating: @post.rating - 1)
      @post.votes.create user_id: params[:user_id]
    end
    redirect_to @post
  end
end
