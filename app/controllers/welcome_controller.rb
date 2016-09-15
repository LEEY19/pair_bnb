class WelcomeController < ApplicationController
  before_action :authenticate_user

  def home
    @users = User.all
  end

  def authenticate_user
    if signed_out?
      redirect_to sign_in_path 
    end
  end
end
