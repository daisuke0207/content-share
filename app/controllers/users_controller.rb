class UsersController < ApplicationController
  before_action :move_to_session, only: [:my_post]

  def show
    @user = User.find(params[:id])
    @posts = @user.posts.where(is_publish: true).order('created_at DESC')
  end

  def my_post

  end

  private

  def move_to_session
    redirect_to new_user_session_path unless user_signed_in?
  end
end
