class Member < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable


  has_many :addresses, dependent: :destroy
  has_many :orders
  has_many :carts, dependent: :destroy

  enum is_deleted: { 退会: true, 有効: false }

  def active_for_authentication?
  super && self.is_deleted == '有効'
  end
end