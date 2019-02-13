class SessionsController < ApplicationController

  def new
   @user = User.new
  end

  def create
    @user = User.find_by(name: params[:user][:name], password: params[:user][:password])
   if @user.authenticate(params[:password])
        session[:user_id] = @user.id
        redirect_to hello_path
    else
        redirect_to login_path
    end

 end
end
