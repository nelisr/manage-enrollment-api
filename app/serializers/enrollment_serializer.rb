class EnrollmentSerializer < ApplicationSerializer
  attributes :id, 
             :amount, 
             :installments, 
             :due_day, 
             :student_id,
             :bills

  def bills
    object.bills.map do |bill|
      ::BillSerializer.new(bill).attributes
    end
  end
end
