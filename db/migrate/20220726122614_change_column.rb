class ChangeColumn < ActiveRecord::Migration[6.1]
  def change
    change_column :items, :daily_rate, :integer
  end
end
