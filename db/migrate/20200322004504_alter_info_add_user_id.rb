class AlterInfoAddUserId < ActiveRecord::Migration[5.2]
  def change
    add_column :info, :user_id, :integer
    add_index :info, :user_id
  end
end
