class AddOprionUsersRole < ActiveRecord::Migration[5.1]
  def change
    change_column :users, :role, :integer, default: 0
    #Ex:- :default =>''
    #Ex:- change_column("admin_users", "email", :string, :limit =>25)
  end
end
