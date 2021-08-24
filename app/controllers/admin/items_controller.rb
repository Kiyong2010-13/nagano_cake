class Admin::ItemsController < ApplicationController
  def index
    @items = Item.all
    @posts = Item.order(created_at: :desc).page(params[:page]).per(10)
  end
  
  def new
    @item = Item.new
    @genres = Genre.all
  end
  
  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to admin_items_path
    else
      render :new
    end
  end
  
  def show
    @item = Item.find(params[:id])
  end
  
  def edit
    @genres = Genre.all
    @item = Item.find(params[:id])
  end
  
  def update
    @item = Item.find(params[:id])
    if @item.update(item_params)
      redirect_to admin_item_path(@item.id)
    else
      render :edit
    end
  end
  
  private
  def item_params
    params.require(:item).permit(:name, :introduction, :image, :genre_id, :id, :price, :is_active)
  end
end
