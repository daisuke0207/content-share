# frozen_string_literal: true

class UsersController < ApplicationController
  before_action :move_to_session, only: [:my_post]

  def show
    @user = User.find(params[:id])
    @posts = @user.posts.where(is_publish: true).order('created_at DESC').page(params[:page]).per(30)
  end

  def my_post
    @posts = current_user.posts.order('created_at DESC').page(params[:page]).per(30)
  end

  def need_login; end

  private

  def move_to_session
    redirect_to need_login_users_path unless user_signed_in?
  end
end
