class AddColumnsToItems < ActiveRecord::Migration
  def change
    add_column :items, :desc_ru, :string
    add_column :items, :title_eng, :string
    add_column :items, :desc_eng, :string
    add_column :items, :charact, :string
    add_column :items, :fship, :string
    add_column :items, :weight, :string
    add_column :items, :cat1, :string
    add_column :items, :cat2, :string
    add_column :items, :cat3, :string
    add_column :items, :type, :string
    add_column :items, :vendor, :string
  end
end
