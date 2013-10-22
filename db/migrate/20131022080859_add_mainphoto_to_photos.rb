class AddMainphotoToPhotos < ActiveRecord::Migration
  def change
  	add_column :photos, :main, :boolean
  end
end
