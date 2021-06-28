class CreateVehicles < ActiveRecord::Migration[6.0]
  def change
    create_table :vehicles do |t|
      t.string :category
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
