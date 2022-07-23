class ChangeDefaultValueForBookings < ActiveRecord::Migration[6.1]
  def change
    change_column :bookings, :status, :string, default: "Pending"
  end
end
