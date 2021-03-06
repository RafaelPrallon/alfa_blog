class SessionsController < ApplicationController
  
  def new
    
  end
  
  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id
      flash[:success] = "Você se conectou com êxito."
      redirect_to user_path(user)
    else
      flash.now[:danger] = "Houve um erro com os seus dados de autenticação."
      render 'new'
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:success] = "Você se desconectou com êxito."
    redirect_to root_path
  end
  
end