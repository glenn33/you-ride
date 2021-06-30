class AddDescriptionToVehicles < ActiveRecord::Migration[6.0]
  def change
    add_column :vehicles, :description, :text
  end
end
