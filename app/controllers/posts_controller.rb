# frozen_string_literal: true

class PostsController < ApplicationController
  before_action :move_to_session, only: %i[new edit]
  before_action :set_post, only: %i[show edit update destroy]
  before_action :set_publish_posts, only: %i[index show]

  def index
  end

  def show
    @comment = Comment.new
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
    redirect_to root_path unless current_user.id == @post.user_id
  end

  def update
    if @post.update(post_params)
      redirect_to my_post_users_path
    else
      render :edit
    end
  end

  def destroy
    if @post.destroy
      redirect_to my_post_users_path
    else
      render :my_post
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :body, :is_publish, :tag_list).merge(user_id: current_user.id)
  end

  def move_to_session
    redirect_to need_login_users_path unless user_signed_in?
  end

  def set_post
    @post = Post.find(params[:id])
  end

  def set_publish_posts
    @posts = Post.includes(:user).where(is_publish: true).order('created_at DESC').page(params[:page]).per(24)
  end
end
