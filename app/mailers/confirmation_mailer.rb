class ConfirmationMailer < ApplicationMailer
  default from: Rails.application.secrets.mailing_list_admin_address

  def send_mailing_list(timestamp)
    mail to: Rails.application.secrets.mailing_list_address, subject: "B12メーリングリスト 送信テスト #{timestamp}"
  end

  def confirm(member, timestamp)
    @timestamp = timestamp
    mail to: member.mail_address, subject: 'メーリングリストが届いていない方へ'
  end
end
