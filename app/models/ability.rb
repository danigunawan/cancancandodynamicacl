class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # guest user (not logged in)
    if user.has_role? :admin
      can :read, :admin
    end

    # Meta Program Report Authorizations
    # This should probably be cached within the session
    # and invalidated somehow when the AuthorizedCollaborator
    # is updated in scope to this Organization.
    accessible_report_ids(user).each do |id|
      can :read, "report_#{id}".to_sym
    end
  end

  private
  def accessible_report_ids(user)
    ids = []
    user.roles.each do |role|
      ids |= role.collaborations.where(authorizable_type: 'Report').map(&:authorizable_id)
    end

    ids | user.collaborations.where(authorizable_type: 'Report').map(&:authorizable_id)
  end
end
