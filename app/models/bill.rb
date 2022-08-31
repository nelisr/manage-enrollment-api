# == Schema Information
#
# Table name: bills
#
#  id            :bigint           not null, primary key
#  amount        :integer          not null
#  due_date      :date             not null
#  status        :string           default(NULL), not null
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  enrollment_id :bigint           not null
#
# Indexes
#
#  index_bills_on_enrollment_id  (enrollment_id)
#
# Foreign Keys
#
#  fk_rails_...  (enrollment_id => enrollments.id)
#
class Bill < ApplicationRecord
  enum status: { open: 'open', pending: 'pending', paid: 'paid' }

  belongs_to :enrollment

  validates :amount, :due_date, presence: true
  validates :amount, numericality: { greater_than: 0 }
end
