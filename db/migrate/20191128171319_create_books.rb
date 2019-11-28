class CreateBooks < ActiveRecord::Migration[5.1]
  def change
    create_table :books do |t|
      t.string :title
      t.string :status
      t.integer :genre_id
      t.integer :user_id
      t.date :rented_date
      t.date :return_date

      t.timestamps
    end
  end
end
