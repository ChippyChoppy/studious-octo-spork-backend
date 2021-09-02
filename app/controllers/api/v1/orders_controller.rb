class Api::V1::OrdersController < ApplicationController

    def show
        order = Order.find(params[:id])
        render json: order
    end

    def index
        order = Order.all
        render json: order
    end

    def create
        order = Order.create(order_params)
        render json: order
    end

    def destroy 
        order_array = params[:id].split(",")
        order = Order.find_by(user_id: order_array[0], mocktail_id: order_array[1])
        order.delete
        render json: order
    end

    private
    def order_params
        params.require(:order).permit(:customer_id)
    end

end