# We moved payment_type out of order.rb as an enum, into a db table.
# This is actually not a good choice because this means we'll allow users to add/modify/delete
# payment types without changing the code; that in itself may be fine, but it also means
# we'll need that user to define additional payment fields such as credit card number, etc.
# Our application is simply not ready for that degree of "custom input" customization.
# Those were done purely because it was a task in iteration G2.

# == Schema Information
#
# Table name: payment_types
#
#  id         :integer          not null, primary key
#  name       :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class PaymentType < ApplicationRecord
  has_many :orders
end
