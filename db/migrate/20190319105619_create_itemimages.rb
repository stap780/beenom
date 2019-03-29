class CreateItemimages < ActiveRecord::Migration
  def change
    create_table :itemimages do |t|
      t.integer :item_id
      t.string :image
      t.integer :position

      t.timestamps null: false
    end
  end
end
