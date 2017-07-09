class Artist < ApplicationRecord

  validates :name, presence: true
  validates :name, uniqueness: true

  validates :image_url, length: { maximum: 255 }, allow_blank: true

  has_many :songs, :dependent => :delete_all

  def self.order_by_name
    order(:name)
  end
end
