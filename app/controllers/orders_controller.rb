class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :item_find_initialize
  before_action :user_check
  before_action :purchase_check

  def index
    @order_adress = OrderAdress.new
  end

  def create
    @order_adress = OrderAdress.new(order_adress_params)
    if @order_adress.valid?
      pay_item
      @order_adress.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def order_adress_params
    params.require(:order_adress).permit(:postnumber, :shipment_source_id, :municipality, :address, :buildingname, :phonenumber).merge(user_id: current_user.id, item_id: @item.id, token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,
      card: order_adress_params[:token],
      currency: 'jpy'
    )
  end

  def user_check
    if current_user.id == @item.user.id
      redirect_to root_path
    end
  end

  def item_find_initialize
    @item = Item.includes(:order).find(params[:item_id])
  end

  def purchase_check
    if @order.present?
      redirect_to root_path
    end
  end

end