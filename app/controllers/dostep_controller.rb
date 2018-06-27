class DostepController < ApplicationController

  layout "admin"

  before_action :sprawdz_logowanie, :except => [:login, :logowanie, :logout]

  def index
  end
    
  def login
  end

  def logowanie

    if params[:user].present? && params[:password].present?
      admin_szukam = User.where(:user => params[:user]).first
      if admin_szukam
        admin_autoryzacja = admin_szukam.authenticate(params[:password])
      end
    end

    if admin_autoryzacja
      session[:user_id] = admin_autoryzacja.id
      session[:user] = admin_autoryzacja.user
      flash[:notice] = "Zostałeś poprawnie zalogowany."
      redirect_to(:action => 'index')
    else
      flash[:notice] = "Błąd: niepoprawna nazwa użytkownika lub hasło."
      redirect_to(:action => 'login')
    end

  end


  def logout
    session[:user_id] = nil
    session[:user] = nil
    flash[:notice] = "Zostałeś wylogowany"
    redirect_to(:action => "login")
  end


end
