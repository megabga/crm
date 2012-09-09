class SystemModule < ActiveRecord::Base
  attr_accessible :name
  
  def self.CUSTOMER
    find_by_name("Customer")
  end
  
  def self.USER
    find_by_name("User")
  end
  
  def self.CONTACT
    find_by_name("Contact")
  end
  
end
