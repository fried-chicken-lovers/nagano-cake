class Cart < ApplicationRecord
  
  belongs_to :member
  belongs_to :items
  
  def subtotal
    item.with_tax_price * amount
  end
  
end
