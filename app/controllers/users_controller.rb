class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:index,:show,:edit,:update]
  before_action :correct_user,   only: [:edit, :update]
  def show
    @user = User.find(params[:id])
    @book = Book.new
    @books = @user.books
   
  end

  def index
    @book = Book.new
    #  @user = User.find(params[:id])
    @users = User.all
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
       redirect_to user_path(@user.id), notice: " User successfully updated."
    else 
      render :edit, notice: " User updated error."
    end
  end

  def create
  end

  def new
  end
  def edit
    @user = User.find(params[:id])
  end

  private

  def user_params
    params.require(:user).permit(:name,:introduction,:profile_image)
  end
  def correct_user
  @user = User.find(params[:id])
  redirect_to user_path(current_user) unless @user == current_user
  end
end
