class EntryMailer < ApplicationMailer
  def entry_mail(entry)
    @entry = entry
    #mail to: @entry.user.email, subject: "お申込み確認メール"
    mail to: @entry.event.user.email, subject: "お申込み確認メール"
  end
end
