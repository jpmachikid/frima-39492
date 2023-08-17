class ItemsController < ApplicationController
  before_action :move_to_sign_in,except: [:index]
  def index
    @items = Item.includes(:user).order(created_at: :DESC)
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def item_params
    params.require(:item).permit(:item_name,:description,:category_id,:condition_id,:shipping_fee_id,:prefecture_id,:shipping_date_id,:price,:image).merge(user_id: current_user.id)
  end
  def move_to_sign_in
    unless user_signed_in?
      redirect_to '/users/sign_in'
    end
  end
end
