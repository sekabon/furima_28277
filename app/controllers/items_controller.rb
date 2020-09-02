class ItemsController < ApplicationController
  before_action :set_item, only: [:show, :edit, :update, :destory]
  before_action :move_to_index, except: [:index, :show]

  def index
    @items = Item.includes(:user).order('created_at DESC')
    @purchases = Purchase.pluck('item_id')
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
    @purchases = Purchase.pluck('item_id')
  end

  def destroy
    if set_item.destroy
      redirect_to root_path
    else
      render :show
    end
  end

  def update
    if @item.update(item_params)
      redirect_to item_path
    else
      render :edit
    end
  end

  private

  def move_to_index
    redirect_to action: :index unless user_signed_in?
  end

  def set_item
    @item = Item.find(params[:id])
  end

  def item_params
    params.require(:item).permit(:content, :image, :name, :introduction, :category_id, :condition_id, :postage_type_id, :ship_area_id, :ship_days_id, :price).merge(user_id: current_user.id)
  end
end
