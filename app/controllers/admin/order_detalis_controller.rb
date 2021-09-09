class Admin::OrderDetalisController < ApplicationController

  def update
    @order_detali = OrderDetali.find(params[:id])
    @order_detali.update(order_detali_params)
    @order = @order_detali.order
    if @order_detali.making_status == "making"

      @order.making!

    end
    count = 0
    @order_detalis = @order.order_detalis
    @order_detalis.each do |order_detali|
     if order_detali.making_status == "production_completed"
       count += 1
       if count == @order_detalis.count
       @order.preparing_ship!
       end
     end
   end

    redirect_to admin_order_path(@order_detali.order.id)
  end

  private
  def order_detali_params
    params.require(:order_detali).permit(:making_status)
  end
end
