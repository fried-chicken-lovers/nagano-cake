class Member < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable


  has_many :addresses, dependent: :destroy
  has_many :orders
  has_many :carts, dependent: :destroy

  # enum is_deleted: { 退会: true, 有効: false }
  def is_deleted_display
    if is_deleted == true
      p "退会"
    else
      p "有効"
    end
  end

  def view_member_address
    "〒" + postal_code + " " + address + " " + last_name + first_name
  end

  def active_for_authentication?
    super && self.is_deleted == false
  end
end