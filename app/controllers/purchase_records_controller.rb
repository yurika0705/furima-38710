class PurchaseRecordsController < ApplicationController
  before_action :authenticate_user!
  #before_action :non_purchased_item, only: [:index, :create]

  def index
    @item = Item.find(params[:item_id])
    @order_form = OrderForm.new
  end

  def create
    @item = Item.find(params[:item_id])
    @order_form = OrderForm.new(purchase_record_params)
    if @order_form.valid?
      pay_item
      @order_form.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def purchase_record_params
    params.require(:order_form).permit(:post_code, :prefecture_id, :city, :address, :building, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @item.price,   # 商品の値段
      card: purchase_record_params[:token],   # カードトークン
      currency: 'jpy'    # 通貨の種類（日本円）
    )
  end

  #def non_purchased_item
    # itemがあっての、order_form（入れ子構造）。他のコントローラーで生成されたitemを使うにはcreateアクションに定義する。
   # @item = Item.find(params[:item_id])
    #redirect_to root_path if current_user.id == @item.user_id || @item.purchase_record.present?
  #end
end
