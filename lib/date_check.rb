module DateCheck
  def self.call(date)    
    return if date.nil?

    begin
      unless (date.to_date) < Date.today and (date.to_date) > 100.years.ago        
        return false
      end
    rescue      
      return false
    end 

    true
  end
end