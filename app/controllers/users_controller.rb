class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @users =User.all
    @book = Book.new
    # @books = Book.all
    


  end

  def edit
    @user = User.find(params[:id])
    
  end

  def index
    @users = User.all
    @user = current_user
  end

  def update
       @user = User.find(params[:id])
      if @user.update(user_params)
      redirect_to user_path, flash:{notice: "You have updated user successfully."}
      else
      render :edit_user
      end
  end


end