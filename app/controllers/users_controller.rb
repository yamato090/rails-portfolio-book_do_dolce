class UsersController < ApplicationController
  before_action :ensure_correct_user, only: [:update]
  
  def index
      @user = current_user
      @users = User.all
      @recipe = Recipe.new
      @recipes = Recipe.all
  end

  def show
      @user = User.find(params[:id])
      @recipe = Recipe.new
      @recipes = @user.recipes
  end

  def edit
      @user = User.find(params[:id])
      if @user == current_user
        render "edit"
      else
        redirect_to user_path(current_user)
      end
  end
  
  def update
      @user = User.find(params[:id])
      if @user.update(user_params)
        redirect_to user_path(current_user)
      else
        render "edit"
      end
  end
  
  def unsubscribe
  end
  
  def destroy
  end
  
  def user_params
    params.require(:user).permit(:first_name, :last_name, :nickname, :email)
  end
end
