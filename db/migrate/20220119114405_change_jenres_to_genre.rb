class ChangeJenresToGenre < ActiveRecord::Migration[5.2]
  def change
    rename_table :jenres, :genres
  end
end
