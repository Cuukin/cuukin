class User::UsersController < ApplicationController
  before_action :find_user, only: [ :show, :edit, :update ]

  def show
  end

  def edit
  end

  def update
    if @user.update(user_params)
      redirect_to user_path(@user), notice: 'Your profile has been updated.'
    else
      render :edit
    end
  end

  private

  def find_user
    @user = User.find(params[:id])
    authorize @user
  end

  def user_params
    params.require(:user).permit(:first_name, :last_name, :photo, :bio, :username)
  end
end
