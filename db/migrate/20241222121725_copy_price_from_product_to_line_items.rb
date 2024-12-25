# frozen_string_literal: true

# Copy the price from product to line items.
class CopyPriceFromProductToLineItems < ActiveRecord::Migration[7.0]
  def up
    LineItem.all.find_each do |line_item|
      line_item.price = line_item.product.price
      line_item.save!
    end
  end

  def down
    LineItem.all.find_each do |line_item|
      line_item.price = 0
      line_item.save!
    end
  end
end
