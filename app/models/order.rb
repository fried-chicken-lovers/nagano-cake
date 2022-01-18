class Order < ApplicationRecord

  
  belongs_to :member
  
  has_many :order_detail

  enum payment_method: { credit_card: 0, transfer: 1 }
  enum status_method: { waiting_payment: 0, confirm_payment: 1, making: 2, preparing_sending: 3, sent: 4 }

end
