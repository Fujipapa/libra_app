class ChangeColumnToUsersRole < ActiveRecord::Migration[5.1]
  def change
    change_column :users, :role, 'integer USING CAST(role AS integer)', default: 0
    #Ex:- change_column("admin_users", "email", :string, :limit =>25)
  end
end
