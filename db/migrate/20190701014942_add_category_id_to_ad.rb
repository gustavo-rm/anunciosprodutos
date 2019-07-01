class AddCategoryIdToAd < ActiveRecord::Migration[5.2]
  def change
    add_column :ads, :category_id, :integer
  end
end
