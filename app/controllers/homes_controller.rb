class HomesController < ApplicationController
  def top
    @items = Item.all
    @posts = Item.order(created_at: :desc).page(params[:page]).per(10)
  end
  
  def about
  end
  
end
