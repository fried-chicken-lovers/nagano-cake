class Item < ApplicationRecord
  attachment :image

  belongs_to :genre

  has_many :carts, dependent: :destroy
  has_many :order_details
  enum is_deleted: { sale: true, sold: false }

def with_tax_price #消費税を出すメソッド
    (price * 1.1).floor
end


end
