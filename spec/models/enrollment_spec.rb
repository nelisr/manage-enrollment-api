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
require 'rails_helper'

RSpec.describe Enrollment, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
