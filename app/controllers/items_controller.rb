class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
  before_action :item_find_initialize, only: [:show, :edit, :update, :destroy]
  before_action :redirect_to_root_path, only: [:edit, :update, :destroy]

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

  def show
  end

  def edit
  end

  def update
    if @item.update(item_params)
      redirect_to item_path(@item.id)
    else
      render :edit
    end
  end

  def destroy
    if @item.destroy
      redirect_to root_path
    else
      render :show
    end
  end

  private

  def item_params
    params.require(:item).permit(:product_name, :discription, :category_id, :status_id, :price, :shipping_id, :shipment_source_id, :date_of_shipment_id, :image).merge(user_id: current_user.id)
  end

  def item_find_initialize
    @item = Item.find(params[:id])
  end

  def redirect_to_root_path
    if current_user.id != @item.user.id
      redirect_to root_path
    end
  end

end
