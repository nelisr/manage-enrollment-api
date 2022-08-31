class BillsFromEnrollmentService < ApplicationService
  def initialize(enrollment)
    @enrollment_id = enrollment.id
    @amount = enrollment.amount.to_i
    @installments = enrollment.installments.to_i    
    @due_day = enrollment.due_day.to_i
  end

  def call
    create_bills
  end

  private 
  def create_bills
    amount_calc = (@amount / @installments)    
    
    for bill_number in 1..@installments
      bill = Bill.new 
      bill.enrollment_id = @enrollment_id
      bill.amount = amount_calc
      bill.due_date = due_date_generate(bill_number)   
      
      bill.save!
    end 
  end

  def due_date_generate(bill_number)
    current_date  = Date.today    
    current_date_year  = current_date.year
    current_date_month = current_date.month

    current_due_date = Date.new(current_date_year, current_date_month, @due_day)    
    
    return  current_due_date + bill_number.month if current_due_date < current_date

    return  current_due_date if current_due_date >= current_date && bill_number == 1

    return  current_due_date + (bill_number-1).month if current_due_date >= current_date && bill_number > 1
  end
end