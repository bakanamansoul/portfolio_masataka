class Public::CustomersController < ApplicationController

  def show
    @customer = current_customer
  end

  def edit
    @customer = current_customer
  end

  def update
    @customer = current_customer
    if @customer.update(customer_params)
      redirect_to customer_path
    else
      render :edit
    end
  end

  def destroy
    @customer = current_customer
    @customer.destroy
  end
  
  private

  def customer_params
    params.require(:customer).permit(:name, :email, :image)
  end
end
