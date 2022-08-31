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
FactoryBot.define do
  factory :student do
    name { "MyString" }
    cpf { "MyString" }
    birthdate { "2022-08-25" }
    payment_method { "MyString" }
  end
end
