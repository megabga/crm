class Task < ActiveRecord::Base
  attr_accessible :customer_id
  belongs_to :interested, :polymorphic => true, dependent: :destroy
end
