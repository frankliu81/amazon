class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    user_params = params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
    @user = User.new user_params
    puts "user: #{@user.inspect}"
    puts "user.valid >>>>>> #{@user.valid?}"
    if @user.save
      session[:user_id] = @user.id
      redirect_to root_path, notice: "Account created successfully!"
    else
      flash[:alert] = "Check your info again"
      render :new
    end

  end

end
