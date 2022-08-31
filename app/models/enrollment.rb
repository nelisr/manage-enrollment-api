# == Schema Information
#
# Table name: enrollments
#
#  id           :bigint           not null, primary key
#  amount       :integer          not null
#  due_day      :integer          not null
#  installments :integer          not null
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  student_id   :bigint           not null
#
# Indexes
#
#  index_enrollments_on_student_id  (student_id)
#
# Foreign Keys
#
#  fk_rails_...  (student_id => students.id)
#
class Enrollment < ApplicationRecord
  belongs_to :student

  has_many :bills, dependent: :destroy

  validates :amount, :due_day, presence: true
  validates :amount, numericality: { greater_than: 0 }
  validates :installments, numericality: { greater_than: 1 }
  validates :due_day, numericality: { greater_than_or_equal_to: 1, less_than_or_equal_to: 31 }


  def save_and_generate_bills
    return false unless self.save

    BillsFromEnrollmentService.call(self)

    true
  end
end