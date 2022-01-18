class AddColumnToJenre < ActiveRecord::Migration[5.2]
  def change
    add_column :jenres, :name, :string
  end
end
