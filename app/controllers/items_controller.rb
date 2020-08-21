class ItemsController < ApplicationController
  before_action :move_to_index, except: :index
  def index
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
    unless user_signed_in?
      redirect_to action: :index
    end
  end
  private

  def item_params
    params.require(:item).permit(:content, :image, :name, :introduction, :category_id, :condition_id, :postage_type_id, :ship_area_id, :ship_days_id, :price
    ).merge(user_id: current_user.id)
  end
end
