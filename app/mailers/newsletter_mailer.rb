class NewsletterMailer < ApplicationMailer
  default from: "\"MADC\" <no-reply@madc.cr>"

  def send_campaign(newsletter, user)
    @template = newsletter.template
    @user = user  
    mail(to: [user.email], subject: [@template.title])
  end
end
