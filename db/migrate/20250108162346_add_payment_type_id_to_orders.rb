class AddPaymentTypeIdToOrders < ActiveRecord::Migration[7.0]
  def change
    # add_column :orders, :payment_type_id, :integer
    add_reference :orders, :payment_type, foreign_key: true
  end
end
