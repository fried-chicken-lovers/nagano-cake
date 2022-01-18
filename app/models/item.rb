class Item < ApplicationRecord

  belongs_to :jenre

  has_many :carts, dependent: destory
  has_many :order_details

end
