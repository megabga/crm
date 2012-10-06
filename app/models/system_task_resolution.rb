class SystemTaskResolution < ActiveRecord::Base
  attr_accessible :name
  
  def self.RESOLVED
    readonly.find_by_name("RESOLVED")
  end
  
  def self.CANCELED
    readonly.find_by_name("CANCELED")
  end
  
  def self.BLOCKED
    readonly.find_by_name("BLOCKED")
  end  
  
  
  def name
    I18n.t("task_resolutions.%s" % super)
  end
end
