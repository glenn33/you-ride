class AddTwoToVehicles < ActiveRecord::Migration[6.0]
  def change
    add_column :vehicles, :title, :string
    add_column :vehicles, :image_url, :string
  end
end
