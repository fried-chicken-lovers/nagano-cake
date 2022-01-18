class AddColurnToAddress < ActiveRecord::Migration[5.2]
  def change
    add_column :addresses, :residence, :string
  end
end
