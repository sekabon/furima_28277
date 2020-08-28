class PurchasesController < ApplicationController
  
  def index
    @purchase = Purchase.new
    @item = Item.find(params[:item_id])
    #@purchases = @item.purchase.
  end

  

end
