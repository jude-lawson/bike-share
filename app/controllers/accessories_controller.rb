class AccessoriesController < ApplicationController
  def index
    @items = Item.all
  end

  def show
    @accessory = Item.find(params[:id])
  end
end
