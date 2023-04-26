class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @users =User.all
    @book = Book.new

  end

  def edit
    @user = User.find(params[:id])
      unless @user.id == current_user.id
      redirect_to user_path(current_user.id)
      end

  end

  def index
    @users = User.all
    @user = current_user
  end

  def update
       @user = User.find(params[:id])
       unless @user.id == current_user.id
        redirect_to user_path(current_user.id)
       end
        if @user.update(user_params)
          redirect_to user_path, flash:{notice: "You have updated user successfully."}
        else
          render :edit
        end


  end

  private

   def user_params
    params.require(:user).permit(:name, :introduction,:image)
   end


end