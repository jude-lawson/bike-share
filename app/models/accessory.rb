class Accessory < ApplicationRecord
  validates_presence_of :title,
                        :price,
                        :description,
                        :image_url

  has_many :order_accessories
  has_many :orders, through: :order_accessories
end
