class Member < ApplicationRecord
  belongs_to :room
  belongs_to :committee
  belongs_to :department
end
