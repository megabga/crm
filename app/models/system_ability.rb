class SystemAbility < ActiveRecord::Base
  attr_accessible :name

  @@CREATE = readonly.find_by_name("CREATE")  
  @@READ   = readonly.find_by_name("READ")
  @@UPDATE = readonly.find_by_name("UPDATE")
  @@DELETE = readonly.find_by_name("DELETE")
  
  cattr_reader :CREATE, :READ, :UPDATE, :DELETE
end
