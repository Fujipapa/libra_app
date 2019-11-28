class AddIndexToGenresGenre < ActiveRecord::Migration[5.1]
  def change
    add_index :genres, :genre, unique: true
  end
end
