class Product < ActiveRecord::Base

  validates :name, presence: true
  validates :description, presence: true
  validates :features, presence: true
  validates :category_id, presence: true

  belongs_to :category
end
