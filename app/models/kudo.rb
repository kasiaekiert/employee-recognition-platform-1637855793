# frozen_string_literal: true

class Kudo < ApplicationRecord
  belongs_to :receiver, class_name: 'Employee'
  belongs_to :giver, class_name: 'Employee'
end
