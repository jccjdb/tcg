class CreateAbilities < ActiveRecord::Migration[5.2]
  def change
    create_table :abilities do |t|
      t.string :name
      t.string :url
      t.integer :pokemon_id
      t.timestamps
    end
  end
end
