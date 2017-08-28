class Artist < ApplicationRecord
  validates :name, presence: true
  validates :name, uniqueness: true

  validates :image, file_size: { less_than: 1.megabytes }

  has_many :songs, dependent: :destroy
  mount_uploader :image, ImageUploader

  def self.order_by_name
    order(:name)
  end
end
