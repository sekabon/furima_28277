class ItemsController < ApplicationController
  before_action :set_item, only: [:show, :edit, :update]
  before_action :move_to_index, except: [:index, :show]

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
  end
  def update
    if @item.update(item_params)
      redirect_to item_path
    else
      render :edit
    end
  end

  def destroy
  end

  def move_to_index
    redirect_to action: :index unless user_signed_in?
  end

  private
  def set_item
    @item = Item.find(params[:id])
  end
  def item_params
    params.require(:item).permit(:content, :image, :name, :introduction, :category_id, :condition_id, :postage_type_id, :ship_area_id, :ship_days_id, :price).merge(user_id: current_user.id)
  end
end
