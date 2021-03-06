require 'rails_helper'

RSpec.describe 'Accessory Show Page' do
  before :each do
    @image_url = 'https://images.pexels.com/photos/686230/pexels-photo-686230.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260'
    @accessory1 = Accessory.create!(title: 'Accessory 1', price: 1, description: 'This is accessory one', image_url: @image_url)
    @accessory2 = Accessory.create!(title: 'Accessory 2', price: 2, description: 'This is accessory two', image_url: @image_url)
  end
  describe 'A visitor visits the show page for a specific accessory' do
    it 'they should see an image, title, description, and price for my accessory' do
      visit accessory_path(@accessory1)

      expect(page).to have_content(@accessory1.title)
      expect(page).to have_content(@accessory1.description)
      expect(page).to have_content(@accessory1.price)
      expect(page).to have_xpath("//img[contains(@src, @image_url)]")

      expect(page).to_not have_content(@accessory2.title)
      expect(page).to_not have_content(@accessory2.description)
      expect(page).to_not have_content(@accessory2.price)
    end

    it 'they should be able to click \'Add to Cart\'' do
      visit accessory_path(@accessory2)

      click_button 'Add to Cart'

      expect(page).to have_current_path(accessories_path)
      expect(page).to have_content("1 #{@accessory2.title} has been added to your cart!")
      within('#cart-count') do
        expect(page).to have_content('1')
      end
    end

    context 'retired accessory' do
      it 'they should see Accessory Retired and not add to cart' do
        accessory3 = Accessory.create!(title: 'Helmet', price: 10, description: 'Will protect your melon', image_url: @image_url, status: 1)

        visit accessories_path

        click_on accessory3.title
        expect(current_path).to eq(accessory_path(accessory3))

        expect(page).to have_content('Accessory Retired')
        expect(page).to_not have_button('Add to Cart')
      end
    end
  end
end
