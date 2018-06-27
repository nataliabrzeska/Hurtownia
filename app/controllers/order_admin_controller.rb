class OrderAdminController < ApplicationController
   layout 'admin'
   before_action :sprawdz_logowanie

  def index
  	
  	@order = Order.all

  end

  def edycja
  	@order = Order.find(params[:id])
  end

  def aktualizuj
    @order = Order.find(params[:id])
    if @order.update_attributes(order_parametr)
      flash[:notice] = "Zamówienie zostało pomyślnie zaaktualizowane"
      redirect_to(:action => 'index', :id => @order.id)
    else
      
      render ('edycja')
    end
  end

  def order_parametr
    params.require(:order).permit(:name, :telephone, :status, :address)

  end

end
