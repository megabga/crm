class TaskFeedback < ActiveRecord::Base
  attr_accessible :date, :notes, :resolution, :status, :task, :user
  
  belongs_to :task   
  belongs_to :status, class_name: "SystemTaskStatus"
  belongs_to :resolution, class_name: "SystemTaskResolution"
  belongs_to :user
  
end
