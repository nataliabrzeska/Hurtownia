class PublicController < ApplicationController
	layout 'public'
  def index
@product = Product.last(6)
@kategoria =  Category.all

  end

  def product
  	@product = Product.find(params[:id])
  	
  end

  def nowosci
    @product = Product.last(10)
  
  	

  end
  def category
  		@category =  Category.find(params[:category_id])
  end

   def order
    @product = Product.all
    @quantity = params[:k][:qq]
    @product = Product.find(params[:k][:idd])
    @order = Order.new
    @result = @product.price*Integer(@quantity)
  end


  def addOrder
    @order = Order.new(order_parametry)
    @order.product_id = params[:orderr][:idd]
    @order.quantity = params[:orderr][:qq]
    @order.status = "W realizacji"
    if @order.save
      flash[:notice] = "Zamówienie zostało złożone"
      redirect_to(:action => 'statusOrder')
    else
      render 'product'
    end
  end

    
  def order_parametry
      params.require(:orderr).permit(:name, :lastName, :address, :email, :telephone)
  end


end 
