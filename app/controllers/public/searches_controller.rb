class Public::SearchesController < ApplicationController
  before_action :authenticate_customer!

  def search
    @model = params[:model]
    @content = params[:content]
    @method = params[:method]

    if @model == "Customer"
      @records = Customer.search_for(@content,@method)
    else
      @records = Store.search_for(@content,@method)
    end
  end
end
