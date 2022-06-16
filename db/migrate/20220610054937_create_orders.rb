class CreateOrders < ActiveRecord::Migration[7.0]
  def change
    create_table :orders do |t|
      t.string :orderid
      t.string :recipient_name
      t.date :ordered_date
      t.integer :card_value
      t.float :commission
      t.string :delivery_status
      t.integer :user_id

      t.timestamps
    end
    add_index :orders, :user_id
  end
end
