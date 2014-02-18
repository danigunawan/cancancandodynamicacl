class Role < ActiveRecord::Base
  has_and_belongs_to_many :users, :join_table => :users_roles
  has_many :collaborations, class_name: 'AuthorizedCollaborator', as: 'accessible'
  belongs_to :resource, :polymorphic => true

  scopify
  # attr_accessible :title, :body
end
