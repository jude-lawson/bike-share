class CartsController < ApplicationController
  include ActionView::Helpers::TextHelper

  def create
    item = Item.find(params[:item_id])

    item_id = item.id.to_s
    cart = Cart.new(session[:cart])
    cart.add_item(item_id)
    session[:cart] = cart
    flash[:notice] = "#{cart.item_count(item_id)} #{item.title} has been added to your cart!"

    redirect_to accessories_path
  end
end
