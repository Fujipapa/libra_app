class AddTitleKanaColmunToBooks < ActiveRecord::Migration[5.1]
  def change
    add_column :books, :title_kana, :string
    #Ex:- add_column("admin_users", "username", :string, :limit =>25, :after => "email")
  end
end
