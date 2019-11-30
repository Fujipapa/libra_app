class RemoveColumnFromBooks < ActiveRecord::Migration[5.1]
  def change
    remove_column :books, :resarvation_user_id
  end
end
