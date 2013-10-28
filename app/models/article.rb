class Article < ActiveRecord::Base

  translates :title, :content, :annotation

  validates :title, presence: true
  validates :content, presence: true
  validates :annotation, presence: true, length: { maximum: 160 }

  has_many :photos, :as => :photoable
  accepts_nested_attributes_for :photos, :allow_destroy => true

  scope :recent, -> { order("created_at DESC").limit(4) }
end