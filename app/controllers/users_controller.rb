class UsersController < Clearance::UsersController

  def create
    @user = User.new(user_params)

    if @user.save
      sign_in @user
      @users = User.all
      redirect_to welcome_home_url
    else
      render template: "users/new"
    end
  end

  private

  def user_params   
    params.require(:user).permit(:email, :password, :first_name, :last_name, :birthday)
  end


end
