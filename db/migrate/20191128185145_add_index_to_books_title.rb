class AddIndexToBooksTitle < ActiveRecord::Migration[5.1]
  def change
    add_index :books, :title
  end
end
