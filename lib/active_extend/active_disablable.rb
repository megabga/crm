
require 'devise/orm/active_record'

module ActiveDisablable
  
  def self.included(base)
    #base.extend(ClassMethods)
    base.send(:default_scope) { base.where("enabled = TRUE") }
  end
  
  #module ClassMethods
  #  
  #end
  
  def disable
    self.enabled = false
  end
  
  def enable
    self.enabled = true
  end
  
  def is_enabled?
    self.enabled
  end
  
  def destroy
    if (@destroy_fully)
      super
    else
      disable
      self.save
    end
  end
  
  def recovery
    enable
    self.save
  end
  
  def destroy_fully
    @destroy_fully = true
    self.destroy
  end
    
end