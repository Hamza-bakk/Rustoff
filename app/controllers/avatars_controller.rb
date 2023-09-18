class AvatarsController < ApplicationController

  #Cela permet de créer l'avatar dans profile
  
  def create
    @user = User.find(params[:user_id])
    @user.avatar.attach(params[:avatar])
    redirect_to(user_path(@user))
  end
end