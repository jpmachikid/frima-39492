class OrdersController < ApplicationController
  def index
    @order_shipment = OrderShipment.new
    @item = Item.find(params[:item_id])
    if user_signed_in? && current_user.id == @item.user.id
      redirect_to root_path
    end

    unless user_signed_in?
      redirect_to root_path
    end
    
  end
  
  def create
    @item = Item.find(params[:item_id])
    @order_shipment = OrderShipment.new(order_params)
    if @order_shipment.valid?
      @order_shipment.save
      
      redirect_to root_path
    else
      render :index, status: :unprocessable_entity
    end
  end
 
  private
  def order_params
    params.require(:order_shipment).permit(:item_id,:postal_code,:prefecture_id,:city,:house_number,:building,:telephone).merge(user_id: current_user.id, item_id: @item.id)
  end
end
