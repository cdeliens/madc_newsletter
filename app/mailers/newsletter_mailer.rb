class NewsletterMailer < ApplicationMailer
  default from: "\"MADC\" <no-reply@madc.cr>"

  def send_campaign(newsletter)


    headers "X-SMTPAPI" => {
      to: @subscribers,
    }.to_json

    @template = newsletter.template
    # @user = user
    mail(to: "no-reply@madc.cr", subject: [@template.title])
  end
end
