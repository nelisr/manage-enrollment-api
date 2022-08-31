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
FactoryBot.define do
  factory :bill do
    amount { 1 }
    due_date { "2022-08-25" }
    status { "MyString" }
    enrollmet { nil }
  end
end
