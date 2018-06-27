class ProductsController < ApplicationController
  layout 'admin'
  before_action :sprawdz_logowanie

  def index
    @produkt = Product.sortuj
  end

  def nowy
    @produkt = Product.new
    @kategoria = Category.order('Name ASC')
  end

  def dodaj
    @produkt = Product.new(produkty_parametr)
    if @produkt.save
      flash[:notice] = "Produkt został pomyśle dodany"
      redirect_to(:action => "index")
    else

      render ('edycja')

    end
  end

  def pokaz
    @produkt = Product.find(params[:id])
  end

  def edytuj
    @produkt = Product.find(params[:id])

  end

  def aktualizuj
    @produkt = Product.find(params[:id])
    if @produkt.update_attributes(produkty_parametr)
      flash[:notice] = "Produkt został pomyśle zaaktualizowany"
      redirect_to(:action => 'pokaz', :id => @produkt.id)
    else

      render ('edycja')
    end
  end

  def usun
    @produkt = Product.find(params[:id])
  end

  def kasuj
    produkt = Product.find(params[:id]).destroy
    flash[:notice] = "Produkt został pomyśle usunięty"
    redirect_to(:action => "index")
  end

  private

  def produkty_parametr
    params.require(:produkt).permit(:name, :price, :category_id, :description, :picture, :created_at)

  end

end
