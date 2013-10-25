class AddAnnotationToCategories < ActiveRecord::Migration
  def change
  	add_column :categories, :annotation, :text
  end
end
