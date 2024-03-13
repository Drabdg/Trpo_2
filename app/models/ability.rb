# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # гость (не авторизированный пользователь)

    if user.role == 'agent'
      can :manage, Product
    else
      can :read, Product
    end
  end
end
