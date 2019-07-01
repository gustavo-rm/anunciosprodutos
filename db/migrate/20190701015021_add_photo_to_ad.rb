class AddPhotoToAd < ActiveRecord::Migration[5.2]
  def change
    add_column :ads, :photo, :json
  end
end
