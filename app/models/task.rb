
#esta linha me fez perder horas debugando
#include Rails.application.routes.url_helpers

class Task < ActiveRecord::Base
  
  #helper_method :name_or_empty, :current_user
  
  include StringHelper
  
  attr_accessible :name, :interested, :user, :contact, :status, :resolution, :due_time, :finish_time, :notes,
                  :description, :type, :assigned,
                  :type_id, :contact_id, :assigned_id # to form 

  belongs_to :interested, :polymorphic => true
  belongs_to :contact, :polymorphic => true
  belongs_to :status, class_name: "SystemTaskStatus"
  belongs_to :resolution, class_name: "SystemTaskResolution"
  belongs_to :user
  belongs_to :type, class_name: "TaskType"
  belongs_to :assigned, class_name: "User"
  
  has_many :feedbacks, class_name: "task_feedback"

  
  #=========================== VALIDATE <------------------------------------------------
  
  VALID_NAME_REGEX = /\A([A-z0-9.,;\'\"\-\/]\s*)+\z/i
  
  validates :name, :presence => true, length: { maximum: 60 }, format: { with: VALID_NAME_REGEX }, uniqueness: true
  validate :valid_status?
  validates_presence_of :status, :notes, :user
  
  
  private
  
    def valid_status?
      if (((self.status == SystemTaskStatus.CLOSED) and (self.resolution == nil)) or
          ((self.status == SystemTaskStatus.OPENED) and (self.resolution != nil))) then
        errors.add(:status, I18n.t(:not_valid_status_and_resolution, status: name_or_empty(self.status),
                    resolution: name_or_empty(self.resolution)))
        false
      else  
        true
      end
      
    end
  
end
