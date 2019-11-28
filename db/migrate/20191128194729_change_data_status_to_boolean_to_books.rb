class ChangeDataStatusToBooleanToBooks < ActiveRecord::Migration[5.1]
  def change
    change_column :books, :status, :boolean, default: true
    #Ex:- change_column("admin_users", "email", :string, :limit =>25)
  end
end
