class CreateItems < ActiveRecord::Migration[7.0]
  def change
    create_table :items do |t|
      t.string :title
      t.string :brand
      t.string :color
      t.string :type
      t.integer :original_price
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
