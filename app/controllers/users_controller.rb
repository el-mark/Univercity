class UsersController < ApplicationController
  before_action :authenticate_user!, only: :show

  def show
    @opportunities = current_user.opportunities
  end

end
