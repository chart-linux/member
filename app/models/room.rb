class Room < ApplicationRecord
  has_many :members, dependent: :restrict_with_exception
end
