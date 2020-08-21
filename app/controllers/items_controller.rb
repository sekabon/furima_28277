class ItemsController < ApplicationController
  before_action :move_to_index, except: [:index, :new]
  def index
  end
  def new
    @item = Item.new  
  end
  def create
   Item.create(item_params)
  end
  def move_to_index
    unless user_signed_in?
      redirect_to action: :index
    end
  end
  private

  def item_params
    params.require(:item).permit(:content, :image).merge(user_id: current_user.id)
  end
end
