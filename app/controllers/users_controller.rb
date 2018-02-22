class UsersController < ApplicationController
  before_action :set_user, only: [ :show, :edit, :update ]

  def index
    @users = User.by_sign_in
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
  end

  def update
    if current_user.id != @user.id
      respond_to do |format|
        format.html { redirect_to @user, notice: 'Cannot edit another user.' }
      end
    else
      respond_to do |format|
        if @user.update(user_params)
          format.html { redirect_to @user, notice: 'User was successfully updated.' }
          format.json { render :show, status: :ok, location: @user }
        else
          format.html { render :edit }
          format.json { render json: @user.errors, status: :unprocessable_entity }
        end
      end
    end
  end

  private
    def set_user
      @user = User.find(params[:id])
    end

    def user_params
      params.require(:user).permit(:email, :name, :username, :bio, :github_profile_url, :avatar_url)
    end
end
