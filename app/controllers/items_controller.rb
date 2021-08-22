class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :destroy]
  before_action :set_item, only: [:show, :edit, :update]
  before_action :move_to_index, except: [:index, :new, :create, :show]


  def index
    @items = Item.all.order("created_at DESC")
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
      redirect_to item_path
    else
      render :edit
    end
  end

  def destroy
    item = Item.find(params[:id])
    item.destroy
    redirect_to root_path
  end

  private

  def item_params
    params.require(:item).permit(:image, :itemname, :text, :category_id, :status_id, :load_id, :area_id, :shippingday_id,
                                 :price).merge(user_id: current_user.id)
  end

  def move_to_index
    redirect_to root_path if @item.buy.present? || current_user.id != @item.user_id
  end

  def set_item
    @item = Item.find(params[:id])
  end
end
