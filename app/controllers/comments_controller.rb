# frozen_string_literal: true

class CommentsController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.new(comment_params)
    if @comment.save
      redirect_to post_path(@post)
    else
      @comments = @post.connects.includes(:user)
      render "posts/#{@post}"
    end
  end

  def destroy
    post = Post.find(params[:post_id])
    if post.destroy
      redirect_to post_path(post)
    else
      @post = post
      render "/posts/#{@post.id}"
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:body).merge(user_id: current_user.id, post_id: params[:post_id])
  end
end
