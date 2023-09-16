class OrdersController < ApplicationController
  before_action :authenticate_user!
  def index
    gon.public_key = ENV["PAYJP_PUBLIC_KEY"]
    @order_shipment = OrderShipment.new
    item_find
    if user_signed_in? && current_user.id == @item.user.id
      redirect_to root_path
    elsif user_signed_in? && current_user.id != @item.user.id && @item.order != nil
      redirect_to root_path
    end

    unless user_signed_in?
      redirect_to root_path
    end
    
  end
  
  def create
    item_find
    @order_shipment = OrderShipment.new(order_params)
    if @order_shipment.valid?
      pay_item
      @order_shipment.save
      
      redirect_to root_path
    else
      render :index, status: :unprocessable_entity
    end
  end
 
  private
  def order_params
    params.require(:order_shipment).permit(:item_id,:postal_code,:prefecture_id,:city,:house_number,:building,:telephone).merge(user_id: current_user.id, item_id: @item.id, token: params[:token], price: @item.price)
  end

  def item_find
    @item = Item.find(params[:item_id])
  end

  def pay_item
    require 'payjp'
      Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
      Payjp::Charge.create(
        amount: order_params[:price],
        card: order_params[:token],
        currency: 'jpy'
      )
  end
end
