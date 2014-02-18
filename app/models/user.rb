class User < ActiveRecord::Base
  rolify
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable
  belongs_to :organization
  has_many :collaborations, class_name: 'AuthorizedCollaborator', as: 'accessible'
  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me
end

