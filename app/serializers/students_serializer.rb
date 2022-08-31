class StudentsSerializer < ApplicationSerializer
  attributes :id,
             :name,
             :cpf,
             :birthdate,
             :payment_method


  def payment_method
    I18n.t "activerecord.enums.student.payment_method.#{object.payment_method}"
  rescue I18n::ArgumentError
    ""  
  end

  def birthdate
    I18n.l object.birthdate
  rescue I18n::ArgumentError
    ""
  end
end