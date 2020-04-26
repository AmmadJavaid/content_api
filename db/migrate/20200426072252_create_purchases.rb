class CreatePurchases < ActiveRecord::Migration[5.2]
  def change
    create_table :purchases do |t|
      t.datetime :expire_at
      t.decimal :price
      t.string :content_quality
      t.references :purchase_of, polymorphic: true, index: true

      t.timestamps
    end
  end
end
