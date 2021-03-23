class LinkMailer < ApplicationMailer
  MODERATOR_EMAILS = 'moderator@example.com'

  def new_link(link)
    @link = link
    mail(to: MODERATOR_EMAILS, subject: 'New link submitted')
  end
end
