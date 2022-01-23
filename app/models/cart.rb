class Cart < ApplicationRecord

  belongs_to :member
  belongs_to :item

  def subtotal
    item.with_tax_price * quantity#これで各商品の小計でる。
  end

end
