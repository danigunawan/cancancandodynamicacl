class Report < ActiveRecord::Base
  has_many :collaborators, class_name: 'AuthorizedCollaborator', as: 'authorizable'
  attr_accessible :description, :name
end
