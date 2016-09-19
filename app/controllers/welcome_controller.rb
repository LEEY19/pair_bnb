class WelcomeController < ApplicationController
  before_action :authenticate_user

  def home
    @users = User.all.order("created_at DESC")
  end

  def authenticate_user
    if signed_out?
      redirect_to sign_in_path 
    end
  end
end
