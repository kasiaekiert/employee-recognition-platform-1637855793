class Kudo < ApplicationRecord
  belongs_to :employee

  validates :title, presence: true
  validates :content, presence: true
  validates :employee_id, presence: true
end
