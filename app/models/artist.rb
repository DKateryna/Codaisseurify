class Artist < ApplicationRecord
  validates :name, presence: true
  validates :name, uniqueness: true

  validates :image, length: { maximum: 255 }, allow_blank: true

  has_many :songs
  mount_uploader :image, ImageUploader

  def self.order_by_name
    order(:name)
  end
end
