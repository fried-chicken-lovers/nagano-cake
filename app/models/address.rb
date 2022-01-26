class Address < ApplicationRecord

  belongs_to :member

  def view_order_address
    "〒" + postal_code + " " + residence + " " + name
  end

end
