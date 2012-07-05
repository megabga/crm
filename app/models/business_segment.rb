class BusinessSegment < ActiveRecord::Base
  attr_accessible :disable, :name
  
  default_scope order: 'business_segments.name'
end
