# == Schema Information
#
# Table name: orders
#
#  id                 :integer          not null, primary key
#  account_number     :string
#  address            :text
#  credit_card_number :string
#  email              :string
#  expiration_date    :string
#  name               :string
#  po_number          :string
#  routing_number     :string
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  payment_type_id    :integer
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
  validates :payment_type_id,
            inclusion: {
              in: PaymentType.pluck(:id),
              message: 'must be a valid payment type'
            }

  def add_line_items_from_cart(cart)
    cart.line_items.each do |item|
      item.cart_id = nil
      line_items << item
    end
  end
end
