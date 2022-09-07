class UsersController < ApplicationController
  add_breadcrumb "User List", :users_path

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
    add_breadcrumb "Create User", :new_user_users_path
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
    add_breadcrumb "User Detail", :user_path
    @user = UserService.getUserByID(params[:id])
  end

  # function :edit
  # show user edit
  # @return @user
  def edit
    add_breadcrumb "User Detail", :user_path
    add_breadcrumb "Edit User", :edit_user_path
    @user = UserService.getUserByID(params[:id])
  end

  # function :update
  # action update user
  # @return <redirect>
  def update
    @user = UserService.getUserByID(params[:id])
    @user_update = UserService.updateUser(@user, user_params)
    if @user_update
      redirect_to @user
    else
      render :edit
    end
  end

  # function destroy
  # @return [<Type>] <description>
  def destroy
    @user = UserService.getUserByID(params[:id])
    UserService.destroyUser(@user)
    params[:id] = nil
    flash[:notice] = "User has been deleted"
    redirect_to users_path
  end

  private
  # set user parameters
  # @return [<Type>] <description>
  def user_params
    params.require(:user).permit(:id, :name, :email, :password, :password_confirmation, :phone, :address, :birthday, :super_user_flag, :role)
  end
end
