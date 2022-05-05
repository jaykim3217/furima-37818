class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :delivery_day
  belongs_to :post_price
  belongs_to :region
  belongs_to :user
  has_one :buy
  has_one_attached :image

  validates :product, presence: true
  validates :explain, presence: true
  validates :category_id, presence: true, numericality: { other_than: 1 , message: "を入力してください"}
  validates :condition_id, presence: true, numericality: { other_than: 1 , message: "を入力してください"}
  validates :post_price_id, presence: true, numericality: { other_than: 1 , message: "を入力してください"}
  validates :region_id, presence: true, numericality: { other_than: 1 , message: "を入力してください"}
  validates :delivery_day_id, presence: true, numericality: { other_than: 1 , message: "を入力してください"}
  validates :price, presence: true, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999, only_integer: true }
  validates :image, presence: true
end
