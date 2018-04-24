class OrdersController < ApplicationController
  def create
    orders = []
    params[:orders].each do |order|
      o = Order.new(order.permit(:amount, :status))
      orders.push(o)
    end

    render plain: "#{orders.size}"
  end

  private

  # Only allow a trusted parameter "white list" through.
  def order_params
    params.permit([:amount, :status])
  end
end
