class ChangeColumnToUsersRole < ActiveRecord::Migration[5.1]
  def change
    change_column :users, :role, 'USING status::integer', default: 0
    #Ex:- change_column("admin_users", "email", :string, :limit =>25)
  end
end
