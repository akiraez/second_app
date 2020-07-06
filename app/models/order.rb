class Order < ApplicationRecord
  enum method_payment: { card: 1, bank: 2 }

  enum order_status: {waiting_for_payment: 1, payment_confirmation: 2, in_production: 3,
    preparing_for_shipping: 4, sent: 5}


  has_many :order_details
  belongs_to :end_user

  validates :name, presence: true
  validates :address, presence: true
  validates :post_number, presence: true
end
