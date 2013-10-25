class AddAnnotationToArticles < ActiveRecord::Migration
  def change
    add_column :articles, :annotation, :text
  end
end
