class Member < ApplicationRecord
  belongs_to :room, optional: true
  belongs_to :committee, optional: true
  belongs_to :department, optional: true

  validates :name, presence: true

  default_scope { order :room_id, :department_id, :committee_id }
end
