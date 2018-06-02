require 'rails_helper'

RSpec.describe 'Bike Shop Page' do
  before :each do
    n = 0
    @accessories = []
    24.times do
      n += 1
      @accessories << Accessory.create!(title: "Item #{n}", price: "#{n}.00".to_f, image_url: "https://www.pexels.com/photo/white-bicycle-road-sign-686230/", description: "This is the description for accessory#{n}")
    end
  end

  context '/bike-shop' do
    describe 'A visitor visits the bike shop page' do
      it 'they should see at least 12 bike accessories (accessories) for sale' do
        visit '/bike-shop'

        i = 0
        @accessories.length.times do
          expect(page).to have_content(@accessories[i].title)
          expect(page).to have_content(@accessories[i].price)
          expect(page).to have_content(@accessories[i].description)
          i += 1
        end
      end

      it 'there should be Add to Cart buttons for each accessory' do
        visit '/bike-shop'

        i = 0
        @accessories.length.times do
          within("#accessory-#{@accessories[i].id}") do
            expect(page).to have_link('Add to Cart')
          end
          i += 1
        end
      end
    end

    describe 'A visitor clicks the \'Add to Cart\' button for an accessory' do
      it 'should display a flash message saying that the accessory has been added to the cart' do
        visit '/bike-shop'

        within("#accessory-#{@accessories[0].id}") do
          click_link 'Add to Cart'
        end
        expect(page).to have_content("1 #{@accessories[0].title} has been added to your cart!")

        within("#accessory-#{@accessories[11].id}") do
          click_link 'Add to Cart'
        end
        expect(page).to have_content("1 #{@accessories[11].title} has been added to your cart!")

        within("#accessory-#{@accessories[23].id}") do
          click_link 'Add to Cart'
        end
        expect(page).to have_content("1 #{@accessories[23].title} has been added to your cart!")
      end

      it 'the cart count should update on all pages' do
        visit '/bike-shop'

        within("#accessory-#{@accessories[0].id}") do
          click_link 'Add to Cart'
        end

        within('#cart-count') do
          expect(page).to have_content('1')
        end

        visit root_path

        within('#cart-count') do
          expect(page).to have_content('1')
        end

        visit trips_path

        within('#cart-count') do
          expect(page).to have_content('1')
        end
      end
    end
  end
end
