class Admin::StoresController < ApplicationController

  def new
    @store = Store.new
  end

  def create
    store = Store.new(store_params)
    store.save
    redirect_to "/top"
  end

  def index
    @stores = Store.all
  end

  def show
    @store = Store.find(params[:id])
  end

  def edit
    @store = Store.find(params[:id])
  end

  def update
    store = Store.find(params[:id])
    store.update(store_params)
    redirect_to admin_store_path(store.id)
  end

  private

  def store_params
    params.require(:store).permit(:postcode, :address, :image, :name, :genre_name, :menu, :business_hours, :fixed_holiday, :access)
  end
end
