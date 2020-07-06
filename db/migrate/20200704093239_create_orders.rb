class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|

      t.integer "end_user_id"
      t.string "name"
      t.string "post_number"
      t.string "address"
      t.integer "method_payment", default: 1
      t.integer "total_payment"
      t.integer "order_status", default: 1

      t.timestamps
    end
  end
end
