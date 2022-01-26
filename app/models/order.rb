class Order < ApplicationRecord


  belongs_to :member

  has_many :order_details

  enum payment_method: { credit_card: 0, transfer: 1 }
  enum status: { waiting_payment: 0, confirm_payment: 1, making: 2, preparing_sending: 3, sent: 4 }

  def view_member_address
    "〒" + postal_code + " " + adress + " " + name
  end

end
