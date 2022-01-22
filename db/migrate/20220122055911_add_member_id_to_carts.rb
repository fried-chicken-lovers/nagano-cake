class AddMemberIdToCarts < ActiveRecord::Migration[5.2]
  def change
    add_column :carts, :member_id, :integer
  end
end
