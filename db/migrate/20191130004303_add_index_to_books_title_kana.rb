class AddIndexToBooksTitleKana < ActiveRecord::Migration[5.1]
  def change
    add_index :books, :title_kana
    #Ex:- add_index("admin_users", "username")
  end
end
