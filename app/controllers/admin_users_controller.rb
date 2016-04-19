class AdminUsersController < ApplicationController

  def index
    @admin_users = AdminUser.all
  end

  def new
    @admin_user = AdminUser.new()
  end

  def create
    @user = AdminUser.new(params[:admin_user])
    if @user.save
      flash[:notice] = "Successfully created User."
      redirect_to admin_users_path
    else
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
    if @user.update_attributes(admin_user_params)
      flash[:notice] = "Successfully updated User."
      redirect_to admin_users_path
    else
      render :action => 'edit'
    end
  end

  def destroy
    @user = AdminUser.find_by(id: params[:id])
    if @user.destroy
      flash[:notice] = "Successfully deleted User."
      redirect_to admin_users_path
    end
  end

  private

  def admin_user_params
    params.require(:admin_user).permit(:first_name, :last_name, :password, :password_confirmation)
  end
end
