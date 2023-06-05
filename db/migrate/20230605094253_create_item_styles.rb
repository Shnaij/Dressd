class CreateItemStyles < ActiveRecord::Migration[7.0]
  def change
    create_table :item_styles do |t|
      t.references :item, null: false, foreign_key: true
      t.references :style, null: false, foreign_key: true

      t.timestamps
    end
  end
end
