class CreatePhotos < ActiveRecord::Migration
  def change
    create_table :photos do |t|
      t.string :name
      t.string :image
      t.integer :photoable_id
      t.string :photoable_type

      t.timestamps
    end
  end
end
