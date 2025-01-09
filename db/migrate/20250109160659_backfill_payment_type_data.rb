class BackfillPaymentTypeData < ActiveRecord::Migration[7.0]
  def up
    # Use a fixed mapping: old `pay_type` enum values => new `payment_type_id`
    # 0 => ID 1 (Check), 1 => ID 2 (Credit Card), 2 => ID 3 (Purchase Order)
    Order.find_each do |order|
      case order.read_attribute(:pay_type)
      when 0
        order.update!(payment_type_id: 1) # Check
      when 1
        order.update!(payment_type_id: 2) # Credit Card
      when 2
        order.update!(payment_type_id: 3) # Purchase Order
      else
        raise "Unexpected pay_type value: #{order.read_attribute(:pay_type)} for order ID: #{order.id}"
      end
    end
  end

  def down
    # Reverse the fixed mapping: `payment_type_id` => old `pay_type` enum values
    # ID 1 (Check) => 0, ID 2 (Credit Card) => 1, ID 3 (Purchase Order) => 2
    Order.find_each do |order|
      case order.payment_type_id
      when 1
        order.update!(pay_type: 0) # Check
      when 2
        order.update!(pay_type: 1) # Credit Card
      when 3
        order.update!(pay_type: 2) # Purchase Order
      else
        raise "Unexpected payment_type_id value: #{order.payment_type_id} for order ID: #{order.id}"
      end
    end
  end
end
