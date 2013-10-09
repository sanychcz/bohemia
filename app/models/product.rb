class Product < ActiveRecord::Base

  validates :name, presence: true
  validates :description, presence: true
  validates :features, presence: true

  belongs_to :category
end
