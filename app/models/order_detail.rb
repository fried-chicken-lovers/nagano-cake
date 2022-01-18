class OrderDetail < ApplicationRecord
  enum making_method: {impossible:0,waiting:1,making:2,finish:3}
end

