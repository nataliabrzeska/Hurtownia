class PicturesController < ApplicationController


  layout "admin"

  before_action :sprawdz_logowanie
  before_action :szukaj_galerie

  def index
    @pictures = @galerie.pictures.sortuj
  end

  def nowe
    @pictures = Picture.new({:galerie_id => @galerie.id, :nazwa => "Wprowadź nazwę zdjęcia"})
    @galeria = Galerie.order('pozycja ASC')
  end

  def utworz
    @pictures = Picture.new(zdjecia_parametry)
    if @zdjecia.save
      flash[:notice] = "Zdjęcie zostało dodane do bazy"
      redirect_to(:action => 'index', :galerie_id => @galerie.id)
    else
      @galeria = Galerie.order('pozycja ASC')
      render('nowe')  
    end
  end

  def pokaz
    @pictures = Picture.find(params[:id])
  end

  def edycja
    @pictures = Picture.find(params[:id])
    @licznik = Picture.count
    @galeria = Galerie.order('pozycja ASC')
  end

  def aktualizuj
    @pictures = Picture.find(params[:id])
    if @pictures.update_attributes(pictures_parametry)
      flash[:notice] = "Zdjęcie zostało zmodyfikowane"
      redirect_to(:action => 'pokaz', :id => @pictures.id, :galerie_id => @galerie.id)
    else
      @licznik = Zdjecie.count
      @galeria = Galerie.order('pozycja ASC')
      render('edycja')  
    end
  end

  def usun
    @pictures = Zdjecie.find(params[:id])
  end

  def kasuj
    pictures = Zdjecie.find(params[:id]).destroy
    flash[:notice] = "Zdjęcie #{pictures.nazwa} zostało usunięte"
    redirect_to(:action => "index", :galerie_id => @galerie.id)
  end

private

  def pictures_parametry
      params.require(:pictures).permit(:galerie_id, :nazwa, :pozycja, :widoczne, :picture, :opis, :created_at)
  end

  def szukaj_galerie
    if params[:galerie_id]
      @galerie = Galerie.find(params[:galerie_id])
    end
  end

end
