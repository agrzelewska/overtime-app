class PostPolicy < ApplicationPolicy
  def update?
    (user.id == record.user_id) || admin_types.include?(user.type)
  end
end