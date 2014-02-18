class CreateAuthorizedCollaborators < ActiveRecord::Migration
  def change
    create_table :authorized_collaborators do |t|
      t.references :authorizable, polymorphic: true
      t.references :accessible, polymorphic: true
      t.timestamps
    end
  end
end
