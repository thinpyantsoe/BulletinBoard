class UsersController < ApplicationController
  before_action :authorized

  # function :index
  # show user list
  # @return @users
  def index
   @users = UserService.getAllUsers
  end

  # function : new
  # show create user page
  # @return @user
  def new
    @user = User.new
  end

  # function : new_user
  # user create
  # @return @user_create
  def new_user
    @user = User.create(user_params)
    @user_create = UserService.createUser(@user)
    if @user_create
      if current_user
        redirect_to users_path
      else
        redirect_to login_path
      end
    else
      render :new
    end
  end

  # function :show
  # show user detail
  # @return @user
  def show
    @user = UserService.getUserByID(params[:id])
  end

  # function :edit
  # show user edit
  # @return @user
  def edit
    @user = UserService.getUserByID(params[:id])
  end

  # function :update
  # action update user
  # @return <redirect>
  def update
    @user = UserService.getUserByID(params[:id])
    @user_update = UserService.updateUser(@user, update_user_params)
    if @user_update
      redirect_to @user
    else
      render :edit
    end
  end

  # function :destroy
  # action delete user
  # @return [<Type>] <description>
  def destroy
    @user = UserService.getUserByID(params[:id])
    UserService.destroyUser(@user)
    flash[:notice] = "User has been deleted"
    redirect_to users_path
  end

  # function :profile
  # user profile detail
  # @return [<Type>] <description>
  def profile
    @user = current_user
  end

  # function :edit_profile
  # edit profile
  # @return [<Type>] <description>
  def edit_profile
    @user = current_user
  end

  # function :update_profile
  # action update profile
  # @return [<Type>] <description>
  def update_profile
    @user = current_user
    @update_profile = UserService.updateUser(@user, update_user_params)
    if @update_profile
      redirect_to profile_users_path
    else
      redirect_to :edit_profile
    end
  end

  private
  # set user parameters for create
  # @return [<Type>] <description>
  def user_params
    params.require(:user).permit(:id, :name, :email, :password, :password_confirmation, :phone, :address, :birthday, :super_user_flag, :role)
  end

  # set user parameters for update
  # @return [<Type>] <description>
  def update_user_params
    params.require(:user).permit(:id, :name, :email, :phone, :address, :birthday, :super_user_flag, :role)
  end
end
