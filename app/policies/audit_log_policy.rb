class AuditLogPolicy < ApplicationPolicy
  def index?
    return true if admin?
  end

  def confirm?
    user_or_admin
  end

  private

  def admin?
    admin_types.include?(user.type)
  end

  def user_or_admin
    user.id == record.user_id || admin?
  end
end