module CustomersHelper
  
  def customers_invalids
    #TODO: customers_invalids
    Customer.where(:complete => nil).count
  end
  
  def birthdays
    #TODO: birthdays
    0
  end
  
  def format_namedlist(list)
     list.all.collect {|item| "#{item.name}" }.join ", "
  end
  
end
