class UsersController < ApplicationController

  def new

    @user = User.new
  end

  def create
    binding.pry
    if !params[:user][:password] || params[:user]== ""
     redirect_to '/sessions/new'
   else
     User.create(user_params)
   end
 end

   private

   def user_params
     params.require(:user).permit(:name, :password, :password_confirmation)
   end

end
