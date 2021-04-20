class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :item_choose, only: [:show, :edit]
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
  end

  private

  def item_params
    params.require(:item).permit(:name, :category_id, :status_id, :description, :postage_id, :from_id, :sendabout_id, :price,
                                 :image).merge(user_id: current_user.id)
  end
  
  def item_choose
    @item = Item.find(params[:id])
  end
end
