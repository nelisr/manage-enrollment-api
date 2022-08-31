# == Schema Information
#
# Table name: students
#
#  id             :bigint           not null, primary key
#  birthdate      :date
#  cpf            :string           not null
#  name           :string           not null
#  payment_method :string           not null
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#
# Indexes
#
#  index_students_on_cpf  (cpf) UNIQUE
#
require 'rails_helper'

RSpec.describe Student, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
