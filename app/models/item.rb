class Item < ApplicationRecord
  belongs_to :user

  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category, :status, :load, :area, :shippingday

  validates :image, presence: true
  validates :itemname, presence: true
  validates :text, presence: true
  validates :category_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :status_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :load_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :area_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :shippingday_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }
end
