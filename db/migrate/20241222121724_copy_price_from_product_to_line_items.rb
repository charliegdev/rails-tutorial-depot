# Copy the price from product to line items.
class CopyPriceFromProductToLineItems < ActiveRecord::Migration[7.0]
  def up
    LineItem.all.each do |line_item|
      line_item.price = line_item.product.price
    end
  end

  def down
    LineItem.all.each do |line_item|
      line_item.price = 0
    end
  end
end
