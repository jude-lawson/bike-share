class CartsController < ApplicationController
  include ActionView::Helpers::TextHelper

  def create
    item = Item.find(params[:item_id])
    item_id = item.id.to_s
    session[:cart][item_id] = session[:cart][item_id] + 1
    @cart.add_item(item)
    session[:cart] = @cart.contents
    flash[:notice] = "#{}#{item.title} has been add to your cart!"
    redirect_to accessories_path
  end
end
