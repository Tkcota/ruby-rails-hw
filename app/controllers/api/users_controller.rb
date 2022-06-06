class Api::UsersController < ApplicationController

  def index 
    users=User.all
    render json: users
end

def show
  @users = User.find(params[:id])
  render json: @users
end

def create
  @users = User.new(user_params)
  if @users.save
    render json: @users
  else
   #failed
  end
end

  def update
   @users = User.find(params[:id])
   if @users.update(user_params)
    render json: @users
   else
    # TODO: ERROR
   end
  end

  def destroy
    @users=User.find(params[:id])
    if @users.destroy
      render json:@users
    else
      # failed
    end
   end

private 

def user_params 
  params.require(:user).permit(:name,:age)
end

end
