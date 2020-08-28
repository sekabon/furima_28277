class PurchasesController < ApplicationController
  
  def index
    @purchase = Purchase.new
    @item = Item.find(params[:item_id])
    #@purchases = @item.purchase.
  end

  def create
    @purchase = Purchase.new(price: purchase_params[:price])
    if @purchase.valid?
      pay_item
      @purchase.save
      return redirect_to root_path
    else
      render 'index'
    end
  end
  private

  def purchase_params
    params.permit(:price, :token)
  end
  
  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: purchase_params[:price],
      caed: purchase_params[:token],
      currency: 'jpy'
    )
  end
end
