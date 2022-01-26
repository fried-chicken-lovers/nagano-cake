class AddColumnToMember < ActiveRecord::Migration[5.2]
  def change
    add_column :members, :last_name, :string
    add_column :members, :first_name, :string
    add_column :members, :last_name_kana, :string
    add_column :members, :first_name_kana, :string
    add_column :members, :postal_code, :string
    add_column :members, :address, :string
    add_column :members, :telephone_namber, :string
  end
end
