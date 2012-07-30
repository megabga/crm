class UserGroup < ActiveRecord::Base
  attr_accessible :user_id, :users_group_id
  
  belongs_to :user
  belongs_to :users_group
  
  validates :user_id, presence: true
  validates :users_group_id, presence: true
end
