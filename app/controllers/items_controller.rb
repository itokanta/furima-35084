class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :item_choose, except: [:index, :new, :create]
  before_action :search_item, only: [:index, :search]
  before_action :move_to_index, only: [:edit, :update, :destroy]
  before_action :move_to_index_sold, only: [:edit, :update, :destroy]

  def index
    @items = Item.includes(:user).order('created_at DESC')
  end

  def search
    @results = @p.result.includes(:items)
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
      redirect_to item_path(@item)
    else
      render :edit
    end
  end

  def destroy
    @item.destroy
    redirect_to root_path
  end

  private

  def item_params
    params.require(:item).permit(:name, :category_id, :status_id, :description, :postage_id, :from_id, :sendabout_id, :price,
                                 :image).merge(user_id: current_user.id)
  end
  
  def item_choose
    @item = Item.find(params[:id])
  end

  def search_item
    @p = Item.ransack(params[:q])
  end

  def move_to_index
    unless current_user == @item.user
      redirect_to action: :index
    end
  end

  def move_to_index_sold
    if @item.buy.present?
      redirect_to action: :index
    end
  end
end
