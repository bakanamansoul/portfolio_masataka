class Public::StoresController < ApplicationController

  def index
    @stores = Store.all
  end

  def show
    @store = Store.find(params[:id])
  end

  private

  def store_params
    params.require(:store).permit(:postcode, :address, :image, :name, :genre_name, :menu, :business_hours, :fixed_holiday, :access)
  end
end
