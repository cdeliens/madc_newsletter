class AdminUsersController < ApplicationController

  def index
    @admin_users = AdminUser.all
  end

  def new
    @admin_user = AdminUser.new()
  end

  def create
    @user = AdminUser.new(admin_user_params)
    if @user.save
      flash[:notice] = "Usuario creado exitósamente."
      redirect_to admin_users_path
    else
      flash[:notice] = @user.errors.full_message
      render :action => 'new'
    end
  end

  def admin_create
    @user = AdminUser.new(admin_user_params)
    if @user.save
      flash[:notice] = "Usuario creado exitósamente."
      redirect_to admin_users_path
    else
      flash[:error] = @user.errors.full_messages.join(", ")
      @admin_user = AdminUser.new()
      render :action => 'new'
    end
  end

  def edit
    @admin_user = AdminUser.find_by(id: params[:id])
  end

  def update
    @user = AdminUser.find_by(id: params[:id])

    params[:admin_user].delete(:password) if params[:admin_user][:password].blank?
    params[:admin_user].delete(:password_confirmation) if params[:admin_user][:password].blank? and params[:admin_user][:password_confirmation].blank?

    if @user && @user.update_attributes(admin_user_params)
      flash[:notice] = "Usuario modificado exitósamente."
      redirect_to admin_users_path
    else
      render :action => 'edit'
    end
  end

  def destroy
    @user = AdminUser.find_by(id: params[:id])
    if @user.destroy
      flash[:notice] = "Usuario borrado exitósamente."
      redirect_to admin_users_path
    end
  end

  private

  def admin_user_params
    params.require(:admin_user).permit(:first_name, :last_name, :password, :password_confirmation, :email)
  end
end
