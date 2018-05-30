require 'rails_helper'

RSpec.describe Cart do

  describe "#total_count" do
    it "can calculate the total number of items it holds" do
      cart = Cart.new({"1" => 2, "2" => 3})

      expect(cart.total_count).to eq(5)
    end

    it 'item_count' do
      cart = Cart.new({'1' => 1, '2' => 3})

      expect(cart.item_count('1')).to eq(1)
      expect(cart.item_count('2')).to eq(3)
    end

    describe 'adds item to cart' do
      it 'add_item' do
        cart = Cart.new
        item = Item.create!(title: 'Accessory 1', price: 1, description: 'This is accessory one', image: 'default/accessory1')

        cart.add_item(item)

        expect(cart.contents).to eq({item.id.to_s => 1})
      end
    end
  end
end
