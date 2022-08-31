class BillSerializer < ApplicationSerializer
  attributes :id, 
             :amount,
             :due_date,
             :status
  

  def status
    I18n.t "activerecord.enums.bill.status.#{object.status}"
  rescue I18n::ArgumentError
    ""  
  end             

  def due_date
    I18n.l object.due_date
  rescue I18n::ArgumentError
    ""
  end
end