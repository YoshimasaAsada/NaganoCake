class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      
      t.integer :end_user_id,    null: false
      t.string  :postal_code,    null: false
      t.string  :address,        null: false
      t.string  :name,           null: false
      t.integer :shipping,       null: false
      t.integer :billing_amount, null: false
      t.integer :payment_method, null: false, default: 0
      t.integer :status,         null: false, default: 0
      
      t.timestamps
    end
  end
end
