class AddPickupLocationToItems < ActiveRecord::Migration[6.1]
  def change
    add_column :items, :pickup_location, :text
  end
end
