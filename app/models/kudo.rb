# frozen_string_literal: true

class Kudo < ApplicationRecord
  belongs_to :receiver, class_name: 'Employee'
  belongs_to :giver, class_name: 'Employee'
  belongs_to :company_value, class_name: 'CompanyValue'

  validate :giver_available_kudos, on: :create

  private

  def giver_available_kudos
    if giver.available_kudos <= 0
      errors.add(:base, 'You cant give more kudos')
    end
  end
end
