class AccessoriesController < ApplicationController
  def index
    @items = Item.all
    @cart = Cart.new(session[:cart])
  end

  def show
    @accessory = Item.find(params[:id])
  end
end
