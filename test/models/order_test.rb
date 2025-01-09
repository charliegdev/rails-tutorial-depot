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
require "test_helper"

class OrderTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
