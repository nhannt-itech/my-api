class CreateItems < ActiveRecord::Migration[7.0]
  def change
    create_table :items do |t|
      t.string :title
      t.float :price
      t.float :shipping_cost
      t.integer :bids
      t.datetime :end_at
      t.string :image

      t.timestamps
    end
  end
end
