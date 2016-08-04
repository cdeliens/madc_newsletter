class NewsletterMailer < ApplicationMailer
  default from: "\"MADC\" <no-reply@madc.cr>"

  def send_campaign(newsletter, email)

    @template = newsletter.template
    mail(to: email, subject: [@template.title])
  end
end
