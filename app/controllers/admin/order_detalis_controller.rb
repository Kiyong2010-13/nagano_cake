class Admin::OrderDetalisController < ApplicationController

  def update
    @order_detali = OrderDetali.find(params[:id])
    @order_detali.update(order_detali_params)
    redirect_to admin_order_path(@order_detali.order.id)
  end

  private
  def order_detali_params
    params.require(:order_detali).permit(:making_status)
  end
end
