class UsersController < ApplicationController
  def show
    @user = User.friendly.find(params[:id])
    @texts = Text.where(user: @user).order(id: :desc).limit(10)
  end
end
