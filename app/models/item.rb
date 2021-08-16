class Item < ApplicationRecord
  belongs_to :user

  has_one_attached :image

  validates :image, presence: true
  validates :itemname, presence: true
  validates :text, presence: true
  validates :category_id, presence: true
  validates :status_id, presence: true
  validates :load_id, presence: true
  validates :area_id, presence: true
  validates :shipping_day_id, presence: true
  validates :price, presence: true
end
