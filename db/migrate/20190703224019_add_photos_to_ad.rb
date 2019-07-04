class AddPhotosToAd < ActiveRecord::Migration[5.2]
  def change
    add_column :ads, :photos, :json
  end
end
