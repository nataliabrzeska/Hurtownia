class ProductsController < ApplicationController
  layout 'admin'
  before_action :sprawdz_logowanie

  def index
    @produkt = Product.sortuj
  end

  def new
    @produkt = Product.new
    @kategoria = Category.order('Name ASC')
  end

  def add
    @produkt = Product.new(produkty_parametr)
    if @produkt.save
      flash[:notice] = "Produkt został pomyśle dodany"
      redirect_to(:action => "index")
    else

      render ('edycja')

    end
  end

  def show
    @produkt = Product.find(params[:id])
  end

  def edit
    @produkt = Product.find(params[:id])

  end

  def update
    @produkt = Product.find(params[:id])
    if @produkt.update_attributes(produkty_parametr)
      flash[:notice] = "Produkt został pomyśle zaaktualizowany"
      redirect_to(:action => 'pokaz', :id => @produkt.id)
    else

      render ('edycja')
    end
  end

  def delete
    @produkt = Product.find(params[:id])
  end

  def remove
    produkt = Product.find(params[:id]).destroy
    flash[:notice] = "Produkt został pomyśle usunięty"
    redirect_to(:action => "index")
  end

  private

  def product_parametr
    params.require(:produkt).permit(:name, :price, :category_id, :description, :picture, :created_at)

  end

end
