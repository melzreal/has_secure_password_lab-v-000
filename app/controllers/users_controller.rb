class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    if params[:user][:password] && params[:user][:password] != params[:user][:password_confirmation]
     redirect_to users_new_path
   else
     @user = User.create(user_params)
     session[:user_id] = @user.id
     redirect_to hello_path
   end
 end

   private

   def user_params
     params.require(:user).permit(:name, :password, :password_confirmation)
   end

end
