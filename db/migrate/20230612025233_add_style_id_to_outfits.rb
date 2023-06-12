class AddStyleIdToOutfits < ActiveRecord::Migration[7.0]
  def change
    add_column :outfits, :style_id, :integer

    add_index :outfits, :style_id
    add_foreign_key :outfits, :styles
  end
end
