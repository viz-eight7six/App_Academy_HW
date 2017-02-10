class HousesTable < ActiveRecord::Migration
  def change
    create_table :houses do |t|
      t.string :name, null: false
      t.integer :id, null: false
      t.string :address, null: false
    end
  end
end
