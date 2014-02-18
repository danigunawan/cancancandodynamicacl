class AuthorizedCollaborator < ActiveRecord::Base
  belongs_to :authorizable, polymorphic: true
  belongs_to :accessible, polymorphic: true

  attr_protected
end
