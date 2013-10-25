class Category < ActiveRecord::Base

  validates :name, presence: true
  validates :description, presence: true
  validates :annotation, presence: true, length: { maximum: 250 }

  has_many :products, dependent: :destroy
  has_many :photos, :as => :photoable
  has_many :documents, :as => :documentable
  accepts_nested_attributes_for :photos, :allow_destroy => true
  accepts_nested_attributes_for :documents, :allow_destroy => true
end
