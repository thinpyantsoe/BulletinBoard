class LoginController < ApplicationController
  # function :login
  # show login page
  def login
    session.delete(:user_id)
    @current_user = nil
  end

  # function :actionLogin
  # @return action login
  def actionlogin
    if params[:session][:email].blank? && params[:session][:password].present?
      redirect_to login_path, notice: Messages::EMAIL_REQUIRE_VALIDATION
    elsif params[:session][:email].present? && params[:session][:password].blank?
      redirect_to login_path, notice: Messages::PASSWORD_REQUIRE_VALIDATION
    elsif params[:session][:email].blank? && params[:session][:password].blank?
      redirect_to login_path, notice: Messages::EMAIL_AND_PASSWORD_REQUIRE_VALIDATION
    else
      user = UserService.findByEmail(params[:session][:email].downcase)
      if user && user.authenticate(params[:session][:password])
        session[:user_id] = user.id
        redirect_to users_path
      else
        redirect_to login_path, notice: Messages::INVALID_EMAIL_OR_PASSWORD
      end
    end
  end

  # function :logout
  # @return logout
  def logout
    session.delete(:user_id)
    @current_user = nil
    redirect_to login_path
  end
end
