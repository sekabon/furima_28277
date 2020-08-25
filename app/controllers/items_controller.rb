class ItemsController < ApplicationController
  before_action :move_to_index, except: :index
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

  def move_to_index
    redirect_to action: :index unless user_signed_in?
  end

  private

  def item_params
    params.require(:item).permit(:content, :image, :name, :introduction, :category_id, :condition_id, :postage_type_id, :ship_area_id, :ship_days_id, :price).merge(user_id: current_user.id)
  end
end
