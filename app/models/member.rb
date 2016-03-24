class Member < ApplicationRecord
  belongs_to :room, optional: true
  belongs_to :committee, optional: true
  belongs_to :department, optional: true
  has_one :face_image

  validates :name, presence: true

  default_scope { order :room_id, :department_id, :committee_id }

  before_save do
    MailingListMailer.add_address(mail_address).deliver
  end

  before_update do
    MailingListMailer.bye_address(mail_address_was).deliver if mail_address_changed?
  end

  before_destroy do
    MailingListMailer.bye_address(mail_address).deliver
  end
end
