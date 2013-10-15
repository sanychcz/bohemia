class Article < ActiveRecord::Base

  validates :title, presence: true
  validates :content, presence: true

  has_many :photos, :as => :photoable
  accepts_nested_attributes_for :photos, :allow_destroy => true
end
