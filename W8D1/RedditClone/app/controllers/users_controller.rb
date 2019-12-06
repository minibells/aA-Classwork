class UsersController < ApplicationController

  def new 
    @user = User.new 
    render :new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      login!(@user)
      redirect_to subs_url
    else
      flash.now[:errors] = @user.errors.full_messages
      render :new
    end
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to user_url(@user)
    else
      flash.now[:errors] = @user.errors.full_messages
      render :edit
    end
  end

  def edit
    @user = User.find(params[:id])
    render :edit 
  end



  private
  def user_params
    params.require(:user).permit(:email, :username, :password)
  end 

end
