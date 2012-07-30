class SystemModule < ActiveRecord::Base
  attr_accessible :name
  
  def self.CUSTOMER
    find_by_name("Customer")
  end
end
