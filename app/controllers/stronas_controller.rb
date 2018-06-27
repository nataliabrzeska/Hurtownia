class StronasController < ApplicationController
  
  layout 'admin'

  def index
    @stronas = Strona.sortuj
  end

  def pokaz
     @strona = Strona.find(params[:id])
  end

  def nowa
    @strona = Strona.new({:nazwa => "Podaj nazwę strony"})
    @product = Product.order('pozycja ASC')
    @licznik = Strona.count + 1
  end

 def utworz
    @strona = Strona.new(strona_parametry)
    if @strona.save
      flash[:notice] = "Strona została pomyślnie utworzona"
      redirect_to(:action=>'index')
    else
      @licznik = Strona.count + 1
      @product = Product.order('pozycja ASC')
      render('nowa')
    end
  end

  def edycja
      @strona = Strona.find(params[:id])
      @product = Product.order('pozycja ASC')
      @licznik = Strona.count
  end

  def aktualizuj
      @strona = Strona.find(params[:id])
    if @strona.update_attributes(strona_parametry)
       flash[:notice] = "Strona została pomyślnie zmodyfikowana"
      redirect_to(:action=>'pokaz', :id => @strona.id)
    else
      @licznik = Strona.count
      @product = Product.order('pozycja ASC')
      render('edycja')
    end
  end


  def usun
    @strona = Strona.find(params[:id])
  end

  def kasuj
    strona = Strona.find(params[:id]).destroy
    flash[:notice] = "Strona '#{strona.nazwa}' została pomyślnie usunięta"
    redirect_to(:action=>'index') 
  end

def strona_parametry
  params.require(:strona).permit(:name,:created_at, :product_id)
end

end
