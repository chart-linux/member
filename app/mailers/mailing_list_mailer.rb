class MailingListMailer < ApplicationMailer
  default to: ENV['MAILING_LIST_CTRL_ADDRESS']
  default from: ENV['MAILING_LIST_ADMIN_ADDRESS']
  before_action :set_admin_password

  def add_address(address)
    @address = address
    mail
  end

  def bye_address(address)
    @address = address
    mail
  end

  private

  def set_admin_password
    @admin_password = ENV['MAILING_LIST_ADMIN_PASSWORD']
  end
end
