class ItemsController < ApplicationController
  before_action :authenticate_user!,except: [:index,:show]
  before_action :find_item,only: [:show,:edit,:update,:destroy]
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

  def show
  end

  def edit
    if user_signed_in? && (current_user.id != @item.user.id || @item.order != nil)
      redirect_to root_path
    end
  end
  def update
    if @item.update(item_params)
    
      redirect_to item_path(@item)
    else
      render :edit, status: :unprocessable_entity
    end
  end
  def destroy
    if user_signed_in? && current_user.id == @item.user.id
    @item.destroy
    redirect_to root_path
    else
    redirect_to item_path(@item)
    end
  end
  private

  def item_params
    params.require(:item).permit(:item_name,:description,:category_id,:condition_id,:shipping_fee_id,:prefecture_id,:shipping_date_id,:price,:image).merge(user_id: current_user.id)
  end
  def find_item
    @item = Item.find(params[:id])
  end

end
