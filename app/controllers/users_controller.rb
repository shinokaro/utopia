class UsersController < ApplicationController
  before_action :authenticate_user!, only: %W(show edit destroy)
  def mypage

  end

  def show
    @user = User.find(params[:id])
  end

  def edit

  end

  def destroy

  end


end
