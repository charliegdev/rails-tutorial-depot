# == Schema Information
#
# Table name: orders
#
#  id              :integer          not null, primary key
#  address         :text
#  email           :string
#  name            :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  payment_type_id :integer
#
# Indexes
#
#  index_orders_on_payment_type_id  (payment_type_id)
#
# Foreign Keys
#
#  payment_type_id  (payment_type_id => payment_types.id)
#
class Order < ApplicationRecord
  has_many :line_items, dependent: :destroy
  belongs_to :payment_type

  validates :name, :address, :email, presence: true
  # TODO: Add back validation
  # validates :pay_type, inclusion: pay_types.keys

  def add_line_items_from_cart(cart)
    cart.line_items.each do |item|
      item.cart_id = nil
      line_items << item
    end
  end
end
