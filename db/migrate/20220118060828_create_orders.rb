class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.string :postal_code
      t.string :adress
      t.string :name
      t.integer :shipping_cost
      t.integer :total_payment
      t.integer :status, default: 0
      t.integer :payment_method
      t.datetime :created_at
      t.datetime :updated_at

      #t.timestamps
    end
  end
end
