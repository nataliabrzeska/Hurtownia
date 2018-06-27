class OrdersController < ApplicationController
  


 def addOrder
    @order = Order.new(order_parametry)
    if @order.save
      flash[:notice] = "Zamówienie zostało złożone"
      redirect_to(:action => 'index')
    else
      render :new
    end
      
    end

    
    def order_parametry
      params.require(:order).permit(:Name, :LastName)
end


end
  

