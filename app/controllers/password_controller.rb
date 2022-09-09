class PasswordController < ApplicationController
  before_action :authorized

  # function :change_password
  # @return [<Type>]
  def change_password
    @user = current_user
  end

  # function :update_password
  # @return [<Type>]
  def update_password
    if params[:user][:password] != params[:user][:password_confirmation]
      redirect_to change_password_path, notice: Messages::PASSWORD_AND_CONFIRM_PASSWORD_NOT_THE_SAME
    else
      @user = current_user
      @is_update_password = PasswordService.updatePassword(@user, params[:user][:password])
      if @is_update_password
        redirect_to profile_users_path
      end
    end
  end
end
