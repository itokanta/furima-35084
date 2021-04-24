class BuysController < ApplicationController
  before_action :authenticate_user!

  def index
    # @item = Item.find(params[:id])
    @buy_address = BuyAddress.new(buy_params)
    if @buy_address.valid?
      buy_address.save
      redirect_to root_path
    else
      render :index
    end
  end

  private
  
  def buy_params
    params.require(:buy_address).permit(:postal_code, :from_id, :cities, :address, :build_name, :phone).merge(user_id: current_user.id, item_id: params[:id])
  end
end