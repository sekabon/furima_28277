class PurchasesController < ApplicationController
  def index
    
    @purchase = ItemPurchase.new
    @item = Item.find(params[:item_id])
    # @purchases = @item.purchase.
  end


  def create    
    @purchase = ItemPurchase.new(purchase_params)
    #binding.pry
    if @purchase.valid? 
      pay_item
      @purchase.save
      return redirect_to root_path
    else
      @purchase = ItemPurchase.new
      @item = Item.find(params[:item_id])
      render 'index'
    end
  end

  private

  def purchase_params
    params.require(:item_purchase).permit(
      :postal_code, :prefecture_id, :city, :house_number, :building_name, :phone_number).merge(
        token: params[:token],item_id: params[:item_id],user_id: current_user.id)
  end

  def pay_item
    @item = Item.find(params[:item_id])
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @item.price,
      card: purchase_params[:token],
      currency: 'jpy'
    )
  end
end
