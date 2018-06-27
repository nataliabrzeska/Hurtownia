class CategoriesController < ApplicationController
  layout 'admin'
   before_action :sprawdz_logowanie

  def index
    @kategoria = Category.sortuj
  end

 

  def nowa
    @kategoria = Category.new
    
  end

  def dodaj
    @kategoria = Category.new(kategoria_parametr)
    if @kategoria.save
      flash[:notice] = "Ketegoria została pomyślnie dodana"
      redirect_to(:action => "index")
      else
      render ('edycja')
  
    end
  end

   def pokaz
    @kategoria = Category.find(params[:id])
  end

  def edycja
    @kategoria = Category.find(params[:id])
   
  end

  def aktualizuj
    @kategoria = Category.find(params[:id])
    if @kategoria.update_attributes(kategoria_parametr)
      flash[:notice] = "Kategoria została pomyślnie zaaktualizowana"
      redirect_to(:action => 'pokaz', :id => @kategoria.id)
    else
      
      render ('edycja')
    end
  end

  def usun
    @kategoria = Category.find(params[:id])
  end

  def kasuj
    kategoria = Category.find(params[:id]).destroy
    flash[:notice] = "Kategoria została pomyśle usunięta"
    redirect_to(:action => "index")
  end

  private

  def kategoria_parametr
    params.require(:kategoria).permit(:name, :created_at)

  end

end
