class LikePolicy < ApplicationPolicy
  def create?
    user.present? && (record.user == current_user)
  end

  def destroy?
    user.present? && (record.user == current_user)
  end

end
