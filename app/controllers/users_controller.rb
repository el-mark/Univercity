class UsersController < ApplicationController
  before_action :authenticate_user!, only: :show

  def home

  end

  def show
    @user = User.find(params[:id])
  end
end
