class UsersController < ApplicationController
  def index
    @users = User.page(params[:page]).per(8)
  end

  def show
    @user = User.find(params[:id])
    @posts = Post.where(user_id: @user.id)
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    # if current_user == @user

      if @user.update(user_params)
        redirect_to @user
      else
        render 'edit'
      end
    # else
      # redirect_to root_path
    # end
  end

  private
    def user_params
      params.require(:user).permit(:name, :gender ,:age, :prefecture, :introduction, :img)
    end
end
