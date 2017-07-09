class Song < ApplicationRecord

  validates :name, presence: true
  validates :name, uniqueness: true
  validates :video_url, length: { maximum: 255 }, allow_blank: true

  belongs_to :artist

  def self.order_by_name
    order(:name)
  end
end
