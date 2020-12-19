# frozen_string_literal: true

class PostsController < ApplicationController
  def index; end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :body, :is_publish).merge(user_id: current_user.id)
  end
end
