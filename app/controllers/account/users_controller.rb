class Account::UsersController < ApplicationController
  before_action :authenticate_user!


  def edit
    @user = current_user
  end

  def update
    @user = current_user
    if @user.update(user_params)
      flash[:notice] = "信息更新成功"
      redirect_to :back
    else
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:username, :email)
  end
end
