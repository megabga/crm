class City < ActiveRecord::Base
  attr_accessible :name, :state
  
  belongs_to :state
end
