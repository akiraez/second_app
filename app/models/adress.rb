class Adress < ApplicationRecord
  belongs_to :end_user

  validates :name, presence: true
  validates :address, presence: true
  validates :post_number, presence: true

  def full_address
    self.address + self.post_number + self.name
  end
end
