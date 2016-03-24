class MailingListMailer < ApplicationMailer
  default to: Rails.application.secrets.mailing_list_ctl_address
  default from: Rails.application.secrets.mailing_list_admin_address
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
    @admin_password = Rails.application.secrets.mailing_list_admin_password
  end
end
