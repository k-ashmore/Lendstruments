class CreateItems < ActiveRecord::Migration[6.1]
  def change
    create_table :items do |t|
      t.string :name
      t.text :details
      t.string :category
      t.float :daily_rate
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
