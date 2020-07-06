class OrderDetail < ApplicationRecord
  belongs_to :item
  belongs_to :order

  enum production_status: {cannot_start: 1, awaiting_production: 2, in_production: 3, production_completed: 4}

end
