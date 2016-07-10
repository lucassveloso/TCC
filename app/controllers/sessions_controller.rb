class SessionsController < ApplicationController
   before_action :block_access, except: [:destroy]

  def new
  end

  def create
    @user = User.find_by(email: params[:session][:email].downcase)
    if @user.nil?
      flash[:error] = "Email não existe!"
      redirect_to sign_in_path
    elsif   @user && @user.authenticate(params[:session][:password])
      sign_in(@user)
      redirect_to root_url, notice: "Login realizado com sucesso!"
    else
      flash[:error] = "Email ou senha inválidos!"
      render 'new'
    end
  end

  def destroy
    sign_out
    redirect_to sign_in_path, notice: "Você finalizou a sua sessão!"
  end
end
