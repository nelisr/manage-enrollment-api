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
class Student < ApplicationRecord  
  enum payment_method: { credit_card: 'credit_card', boleto: 'boleto' }

  has_many :enrollments, dependent: :destroy

  validates :name, :cpf, :payment_method, presence: true
  validates :cpf, uniqueness: true
  validates :payment_method, inclusion: { in: payment_methods.keys }
  validate :valid_cpf   
  validate :valid_birthdate, if: :birthdate

  def cpf=(cpf)
    self[:cpf] = cpf.gsub(/\D/, '') if cpf.present?
  end

  private 
  
  def valid_cpf    
    errors.add(:cpf, invalid_msg) unless Cpf.check(self.cpf)
  end

  def valid_birthdate     
    errors.add(:birthdate, invalid_msg) unless DateCheck.call(self.birthdate) 
  end

  def invalid_msg
    I18n.t("activerecord.errors.messages.invalid")
  end
end
