class CreateAdresses < ActiveRecord::Migration[5.2]
  def change
    create_table :adresses do |t|

      t.integer "end_user_id"
      t.string "post_number"
      t.string "address"
      t.string "name"

      t.timestamps
    end
  end
end
