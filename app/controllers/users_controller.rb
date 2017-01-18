class UsersController < ApplicationController
  def index
    @users = User.all
  end
  
  def new
    @user = User.new
  end
  
  def create
    @user = User.new(user_params)
    if (@user.save)
      flash[:sucess] = "O usuário foi criado com sucesso"
      redirect_to user_path(@user)
    else
      render 'new'
    end
  end
  
  def update
    if (@user.update(user_params))
      flash[:success] = "O usuário foi editado com sucesso"
      redirect_to user_path(@user)
    else
      render 'edit'
    end
  end
  
  def show
  end
  
  def destroy
    @user.destroy
    flash[:danger] = "O usuário foi apagado com sucesso"
    redirect_to users_path
  end
  
  private
    def set_article
     @user = User.find(params[:id])  
    end
    
    def user_params
      params.require(:user).permit(:username, :email)
    end
end