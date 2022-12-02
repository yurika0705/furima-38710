class ItemsController < ApplicationController
  # ログインしていないユーザーはログインページに促す
  before_action :authenticate_user!, except: [:index, :show]
  # 重複処理をまとめる
  before_action :set_item, only: [:edit, :show, :update, :destroy]
  before_action :move_to_index, only: [:edit]
  before_action :my_item, only: [:edit, :destroy]


  def index
    @items = Item.includes(:user).order('created_at DESC')
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
    if my_item && @item.purchase_record.nil?
    else
      redirect_to root_path
    end
  end

  def update
    if @item.update(item_params)
      redirect_to item_path(@item)
    else
      render :edit
    end
  end

  def destroy
    # ログインしているユーザーと同一であればデータを削除する
    if my_item
      @item.destroy
      redirect_to root_path
    else
      redirect_to root_path
    end
  end
end
  private

  def item_params
    params.require(:item).permit(:image, :item_name, :item_info, :category_id, :sales_status_id, :shipping_free_status_id, :prefecture_id, :scheduled_delivery_id, :price, :user).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end

  def move_to_index
    @item = Item.find(params[:id])
  unless @item.user.id == current_user.id || @item.purchase_record != nil
    redirect_to root_path
  end

  def my_item
    @item.user_id == current_user.id
  end


end
