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
