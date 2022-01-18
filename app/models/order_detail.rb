class OrderDetail < ApplicationRecord

  enum making_method: {impossible:0,wating:1,making:2,finish:3}

  belongs_to :orders
  belongs_to :items

end

