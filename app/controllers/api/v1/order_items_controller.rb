class Api::V1::OrderItemsController < ApplicationController

    def show
        order_item = OrderItem.find(params[:id])
        render json: order_item
    end

    def index
        order_item = OrderItem.all
        render json: order_item
    end

    def create
        order_item = OrderItem.create(order_item_params)
        render json: order_item
    end

    def destroy 
        order_item_array = params[:id].split(",")
        order_item = OrderItem.find_by(user_id: order_item_array[0], mocktail_id: order_item_array[1])
        order_item.delete
        render json: order_item
    end

    private
    def order_item_params
        params.require(:order_item).permit(:order_id, :item_id, :quantity, :price, :tax)
    end

end