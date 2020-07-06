class Item < ApplicationRecord
  belongs_to :genre
  has_many :cart_items, dependent: :destroy
  has_many :order_details

  attachment :image

  validates :name, presence: true
  validates :image, presence: true
  validates :description, presence: true
  validates :price_excluding_tax, presence: true
  validates :is_active_sale_status, presence: true
end
