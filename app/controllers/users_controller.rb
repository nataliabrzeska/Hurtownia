class UsersController < ApplicationController

layout "admin"

  before_action :sprawdz_logowanie

  def index
  	@user = User.sortuj
  end

  def nowy
    @user = User.new
  end

  def utworz
    @user = User.new(uzytkownik_parametry)
    if @user.save
      flash[:notice] = "Użytkownik został założony"
      redirect_to(:action => "index")
    else
      render("nowy")
    end
  end

  def edycja
    @user = User.find(params[:id])
  end

  def aktualizuj
    @user = User.find(params[:id])
    if @user.update_attributes(uzytkownik_parametry)
      flash[:notice] = "Dane uzytkownika zostały pomyślnie zmodyfikowane"
      redirect_to(:action => "index")
    else
      render("edycja")
    end
  end

  def usun
  	@user = User.find(params[:id])
  end

  def kasuj
  	user = User.find(params[:id]).destroy
  	flash[:notice] = "Konto użytkownika #{user.firstName} #{user.lastName} zostało pomyślnie usunięte"
  	redirect_to(:action => "index")
  end

private

  def uzytkownik_parametry
    params.require(:user).permit(:firstName, :lastName, :email, :user, :password, :password_confirmation)
  end

end

