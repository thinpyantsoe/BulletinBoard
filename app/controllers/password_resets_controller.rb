class PasswordResetsController < ApplicationController

  # function :new
  #
  def new
  end

  # function :create
  #
  # @return [<Type>]
  def create
    @user = UserService.findByEmail(params[:email].downcase)
    if @user.present?
      @user.send_password_reset
      redirect_to login_path, notice: Messages::PASSWORD_RESET_SENT
    else
      redirect_to login_path, notice: Messages::EMAIL_NOT_EXIST
    end
  end

  # function :edit
  #
  # @return [<Type>]
  def edit
    @user = User.find_by_password_reset_token!(params[:id])
    # fix need
    if @user.blank?
      redirect_to login_path, notice: Messages::URL_INCORRECT
    end
  end

  # function :update
  #
  # @return [<Type>]
  def update
    if params[:user][:password].blank? && params[:user][:password_confirmation].blank?
      redirect_to edit_password_reset_path, notice: Messages::PASSWORD_AND_CONFIRM_PASSWORD_REQUIRED
    elsif params[:user][:password].blank? && params[:user][:password_confirmation].present?
      redirect_to edit_password_reset_path, notice: Messages::PASSWORD_REQUIRE_VALIDATION
    elsif params[:user][:password].present? && params[:user][:password_confirmation].blank?
      redirect_to edit_password_reset_path, notice: Messages::PASSWORD_CONFIRMATION_REQUIRED
    elsif params[:user][:password] != params[:user][:password_confirmation]
      redirect_to edit_password_reset_path, notice: Messages::PASSWORD_AND_CONFIRM_PASSWORD_NOT_THE_SAME
    else
      @user = User.find_by_password_reset_token!(params[:id])
      if @user.password_reset_sent_at < 2.hour.ago
        redirect_to new_password_reset_path, :notice => Messages::PASSWORD_RESET_URL_EXPIRED
      else
        @is_reset_password = @user.update(user_params)
        if @is_reset_password
          redirect_to login_path, :notice => Messages::PASSWORD_RESET_COMPLETE
        else
          render :edit
        end
      end
    end
  end
  
  private
    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:password)
    end

end
