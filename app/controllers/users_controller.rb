class UsersController < ApplicationController
  before_filter :authenticate_user!
  load_and_authorize_resource
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end
  
  def set_roles
    @user = User.find(params[:id])
    params[:user_roles].each do |key, val|
      if val == 'yes'
        @user.add_role(key.to_sym)
      else 
        if(@user.has_role?(key.to_sym))
          @user.revoke(key.to_sym)
        end
      end
    end
    redirect_to users_path
  end

end
