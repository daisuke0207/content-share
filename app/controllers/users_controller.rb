class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @posts = @user.posts.where(is_publish: true).order('created_at DESC')
  end

  def my_post

  end
end
