class UsersController < ApplicationController
  skip_before_filter :verify_authenticity_token
  before_action :authenticate_user!,
  def show
    @user=current_user

  end

  def edit_avatar


    @user=current_user
    @user.avatar=params[:user][:avatar]
    @user.save
    puts @user.errors.full_messages
    render "show"


end


end
