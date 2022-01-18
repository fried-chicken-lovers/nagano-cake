class AddColumnToOrderDetail < ActiveRecord::Migration[5.2]
  def change
    add_column :order_details, :price, :integer
    add_column :order_details, :amount, :integer
  end
end
