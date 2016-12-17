class UsersController < ApplicationController
  def index
  end

  def register

    user = User.new(user_params)
    if user.valid?
      user.save
      session[:email]=user.email
      session[:user_id]=user.id
      redirect_to '/groups'
    else
      puts user.errors.full_messages
      flash[:reg_errors]=user.errors.full_messages
      redirect_to "/"
    end

  end

  def login
    puts params[:user]
    user = User.find_by_email(params[:user][:email])
    puts user
    if user && user.authenticate(params[:user][:password])
      session[:email]=user.email
      session[:user_id]=user.id
      redirect_to '/groups'
    else
      flash[:log_errors] = "Your username or password is invalid"
      redirect_to '/'
    end
  end

  def logout
    reset_session
    redirect_to '/'
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
  end

end
