class CreateAds < ActiveRecord::Migration[5.2]
  def change
    create_table :ads do |t|
      t.string :title
      t.string :description
      t.float :price
      t.integer :viewnumber
      t.integer :quantity

      t.timestamps
    end
  end
end
