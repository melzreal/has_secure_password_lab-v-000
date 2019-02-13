class UsersController < ApplicationController

  def new

    @user = User.new
  end

  def create
    if params[:user][:password] && params[:user][:password] != params[:user][:password_confirmation]
     redirect_to user_path
   else
     User.create(user_params)
   end
 end

   private

   def user_params
     params.require(:user).permit(:name, :password, :password_confirmation)
   end

end
