class Cart < ApplicationRecord
  
  belongs_to :member
  belongs_to :items
end
