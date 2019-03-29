class AddColumnItemNewToItemimages < ActiveRecord::Migration
  def change
    add_column :itemimages, :item_new, :string
  end
end
