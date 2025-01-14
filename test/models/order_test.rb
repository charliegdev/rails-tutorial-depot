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
require "test_helper"

class OrderTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
