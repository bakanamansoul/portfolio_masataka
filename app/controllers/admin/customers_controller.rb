class Admin::CustomersController < ApplicationController

  def index
    @customers = Customer.page(params[:page])
  end

  def show
    @customer = Customer.find(params[:id])
  end

  def destroy
  end
  
  private

  def customer_params
    params.require(:customer).permit(:name, :email, :image)
  end
end
