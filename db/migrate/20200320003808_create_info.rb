class CreateInfo < ActiveRecord::Migration[5.2]
  def change
    create_table :info do |t|
      t.text :message
      t.timestamps
    end
  end
end
