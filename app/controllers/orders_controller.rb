class OrdersController < ApplicationController
  before_action :authenticate_user!, only: [:index, :create]

  def index
    @item = Item.find(params[:item_id])

    if current_user.id == @item.user_id || @item.order.present?
      # 自身が出品した商品の場合または販売済み商品の場合、トップページにリダイレクトする
      redirect_to root_path
    else
      # 出品者でない場合、通常の処理を行う
      @order_address = OrderAddress.new
    end
  end

  def create
    @order_address = OrderAddress.new(order_params)
    if @order_address.valid?
      @order_address.save
      redirect_to root_path
    else
      @item = Item.find(params[:item_id])
      render :index, status: :unprocessable_entity
    end
  end

  private

  def order_params
    params.require(:order_address).permit(:postal_code, :prefecture_id, :city, :address, :building,
                                          :phone_number).merge(user_id: current_user.id,
                                                               item_id: params[:item_id])
  end
end
