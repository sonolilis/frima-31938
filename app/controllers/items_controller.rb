class ItemsController < ApplicationController
  #before_action :authenticate_user!, only: [:new, :edit, :destroy, :create]
  #before_action :set_item, only: [:show, :edit, :update, :destroy]

  def index
    @items = Item.all.includes(:user).order("created_at DESC")
  end

  def new
    @item = Item.new
  end
  
  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end


  private

  def item_params
    params.require(:item).permit(:product_name, :discription, :category_id, :status_id, :price, :shipping_id, :shipment_source_id, :date_of_shipment_id, :image).merge(user_id: current_user.id)
  end

end
