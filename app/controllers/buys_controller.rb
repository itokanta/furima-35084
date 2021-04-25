class BuysController < ApplicationController
  before_action :authenticate_user!
  before_action :item_choose
  before_action :move_to_index

  def index
    @buy_address = BuyAddress.new
  end

  def create
    @buy_address = BuyAddress.new(buy_params)
    if @buy_address.valid?
      @buy_address.save
      redirect_to root_path
    else
      render :index
    end
  end

  private
  
  def buy_params
    params.require(:buy_address).permit(:postal_code, :from_id, :cities, :address, :build_name, :phone).merge(user_id: current_user.id, item_id: params[:item_id])
  end

  def item_choose
    @item = Item.find(params[:item_id])
  end

  def move_to_index
    if current_user == @item.user
      redirect_to root_path
    end
  end
end