class Admin::OrdersController < ApplicationController
  def show
    @order = Order.find(params[:id])
    @order_detalis = @order.order_detalis
  end

  def update
    @order = Order.find(params[:id])
    @order.update(order_params)
    if @order.status == "payment_confirmation"
      @order_detalis = @order.order_detalis
      @order_detalis.each do |order_detali|
        order_detali.waiting_production!
      end
    elsif @order.status == "sent"
      @order_detalis = @order.order_detalis
      @order_detalis.each do |order_detali|
        order_detali.production_completed!
      end
    end
    redirect_to admin_order_path(@order.id)
  end

  private

  def order_params
    params.require(:order).permit(:status)
  end

end
