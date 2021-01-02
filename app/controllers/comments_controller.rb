# frozen_string_literal: true

class CommentsController < ApplicationController
  before_action :set_post, only: %i[create]

  def create
    if @post.comments.create(comment_params)
      redirect_to post_path(@post)
    else
      @comments = @post.connects.includes(:user)
      render "posts/#{@post}"
    end
  end

  def destroy
    comment = Comment.find(params[:id])
    if comment.destroy
      redirect_to post_path(comment.post)
    else
      render "/posts/#{comment.post}"
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:body).merge(user_id: current_user.id, post_id: params[:post_id])
  end

  def set_post
    @post = Post.find(params[:post_id])
  end
end
