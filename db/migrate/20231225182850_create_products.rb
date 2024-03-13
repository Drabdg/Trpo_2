class CreateProducts < ActiveRecord::Migration[7.1]
  def change
    create_table :products do |t|
      t.string :title
      t.date :date
      t.string :price
      t.text :description
      t.references :user, foreign_key: { on_delete: :cascade, on_update: :cascade }, index: true, null: false
      t.timestamps
    end
  end
end
