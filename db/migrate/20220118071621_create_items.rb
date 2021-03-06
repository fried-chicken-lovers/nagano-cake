class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.string :name
      t.text :explanation
      t.integer :price
      t.string :image_id

      t.timestamps
    end
  end
end
