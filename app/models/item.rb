class Item < ApplicationRecord
  belongs_to :genre
  has_many :cart_items, dependent: :destroy
  has_many :order_detalis, dependent: :destroy
  
  attachment :image
  
  def add_tax_price
        (self.price * 1.08).round
  end
end
