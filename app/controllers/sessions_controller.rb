class SessionsController < ApplicationController
  def create
    email = params[:admin][:email].downcase
    passw = params[:admin][:password]

    admin = Admin.where(email: email).first

    unless admin.nil?
      if admin.password == passw
        session[:admin] = admin.id
        redirect_to dashboard_path
      else
        flash[:error] = 'Senha incorreta!'
        redirect_to root_path
      end
    else
      flash[:error] = 'Usuário não existe!'
      redirect_to root_path
    end
  end

  def destroy
    session[:admin] = nil
    redirect_to root_path
  end
end
