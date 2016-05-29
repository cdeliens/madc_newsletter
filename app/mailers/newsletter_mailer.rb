class NewsletterMailer < ApplicationMailer
  default from: 'comunicaciones@deliens.com'

  def send_campaign(newsletter, user)
    @template = newsletter.template

    mail(to: [user.email],
             subject: @template.title)
  end
end
