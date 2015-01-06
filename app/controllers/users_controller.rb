class UsersController < ApplicationController
  before_filter :authenticate_user!
  before_filter :correct_user?, :except => [:index]

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def updated_info
    @user = User.find(params[:id])
    @user.sync_with_bonnier
    render layout: false
  end

end
