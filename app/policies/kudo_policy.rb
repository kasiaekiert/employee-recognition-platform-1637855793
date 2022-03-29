# frozen_string_literal: true

class KudoPolicy < ApplicationPolicy
  def update?
    record.created_at > Time.zone.now - 5.minutes
  end
end
