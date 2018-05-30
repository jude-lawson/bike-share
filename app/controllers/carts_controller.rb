class CartsController < ApplicationController
  include ActionView::Helpers::TextHelper

  def create
    item = Item.find(params[:item_id])

    item_id = item.id.to_s
    session[:cart] ||= Cart.new
    # binding.pry
    session[:cart].add_item(item)
    flash[:notice] = "#{session[:cart].contents[:id]} #{item.title} has been added to your cart!"
    redirect_to accessories_path
  end
end
