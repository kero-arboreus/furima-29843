class UsersController < ApplicationController
  before_action :authenticate_user!

  def show
  end

  def edit
  end

  def update
    current_user.update(user_params)

    if current_user.valid?
      sign_in(current_user, bypass: true)
      redirect_to root_path
    else
      render 'edit'
    end
  end

  private

  def user_params
    params.require(:user).permit(:password, :nickname, :email, :first_name, :last_name, :first_name_kana, :last_name_kana, :birth)
  end
end
