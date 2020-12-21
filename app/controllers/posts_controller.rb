# frozen_string_literal: true
class PostsController < ApplicationController
  before_action :move_to_session, only: [:new]

  def index
    @posts = Post.includes(:user).where(is_publish: true).order('created_at DESC')
  end

  def show
    @post = Post.find(params[:id])
    @posts = Post.includes(:user).where(is_publish: true).order('created_at DESC')
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to root_path
    else
      render :new
    end
  end

  def edit

  end

  def update
    
  end

  private

  def post_params
    params.require(:post).permit(:title, :body, :is_publish).merge(user_id: current_user.id)
  end

  def move_to_session
    redirect_to new_user_session_path unless user_signed_in?
  end
end
