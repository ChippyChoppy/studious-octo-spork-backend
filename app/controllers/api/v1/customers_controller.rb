class Api::V1::CustomersController < ApplicationController

    def index
        customer = Customer.all
        render json: customer 
    end

    def show
        customer = Customer.find(params[:id])
        render json: customer
    end

    def update
        customer = Customer.find(params[:id])
        customer.update(customer_params)
        render json: customer
    end

    private

    def customer_params
        params.require(:customer).permit (:name, :email, :active)
    end
end