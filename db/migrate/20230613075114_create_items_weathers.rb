class CreateItemsWeathers < ActiveRecord::Migration[7.0]
  def change
    create_table :items_weathers do |t|
      t.string :name
      t.references :item, null: false, foreign_key: true

      t.timestamps
    end
  end
end
