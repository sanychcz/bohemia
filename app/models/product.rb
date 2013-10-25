class Product < ActiveRecord::Base

  validates :name, presence: true
  validates :description, presence: true
  validates :features, presence: true
  validates :category_id, presence: true
  validates :annotation, presence: true, length: { maximum: 250 }

  belongs_to :category
  has_many :photos, :as => :photoable
  has_many :documents, :as => :documentable
  accepts_nested_attributes_for :photos, :allow_destroy => true
  accepts_nested_attributes_for :documents, :allow_destroy => true

  scope :recent_products, -> { order("created_at DESC").limit(3) }
end
