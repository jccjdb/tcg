class AlterInfoAddUserId < ActiveRecord::Migration[5.2]
  def change
    add_column :infos, :user_id, :integer
    add_index :infos, :user_id
  end
end
