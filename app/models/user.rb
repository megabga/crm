# == Schema Information
#
# Table name: users
#
#  id         :integer         not null, primary key
#  name       :string(25)
#  email      :string(100)
#  created_at :datetime        not null
#  updated_at :datetime        not null
#

class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable, :registerable
  devise :database_authenticatable,
         :recoverable, :rememberable, :trackable, :validatable
  
  before_save { |user| user.email = email.downcase }
  before_save :create_remember_token
  
  has_many :microposts, dependent: :destroy
  has_many :relationships, foreign_key: "follower_id", dependent: :destroy
  has_many :followed_users, through: :relationships, source: :followed
  
  has_many :reverse_relationships, foreign_key: "followed_id",
                                     class_name:  "Relationship",
                                     dependent:   :destroy
  has_many :followers, through: :reverse_relationships, source: :follower

  
  #attr_readonly :admin
  attr_accessible :name, :email, :password, :password_confirmation, :admin, :remember_me
  
  #BASICS
  VALID_NAME_REGEX = /\A\w+.*\s.*\z/i
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  
  validates :name,  presence: true, length: { maximum: 30 }, format: { with: VALID_NAME_REGEX }, uniqueness: true
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }, uniqueness: { case_sensitive: false } #:email => true
  
  #PASSWORD  
  validates :password, presence: true, length: { minimum: 6 }
  validates :password_confirmation, presence: true
  
  public
  
    def feed
      # This is preliminary. See "Following users" for the full implementation.
      Micropost.where("user_id = ?", id)
    end
    
    def following?(other_user)
      relationships.find_by_followed_id(other_user.id)
    end

    def follow!(other_user)
      relationships.create!(followed_id: other_user.id)
    end
    
    def unfollow!(other_user)
      relationships.find_by_followed_id(other_user.id).destroy
    end
  
  private

    def create_remember_token
      self.remember_token = SecureRandom.urlsafe_base64
    end
  
  
end
