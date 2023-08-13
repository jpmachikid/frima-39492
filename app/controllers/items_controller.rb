class ItemsController < ApplicationController
  def index
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
  end

  private

  def item_params
    params.require(:item).permit(:item_name,:description,:category_id,:condition_id,:shipping_fee_id,:prefecture_id,:shipping_date_id,:price).merge(user_id: current_user.id)
  end
end
