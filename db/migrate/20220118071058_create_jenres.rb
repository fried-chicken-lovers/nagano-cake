class CreateJenres < ActiveRecord::Migration[5.2]
  def change
    create_table :jenres do |t|

      t.timestamps
    end
  end
end
