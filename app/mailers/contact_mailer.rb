class ContactMailer < ApplicationMailer

  def send_notification(member, group, title, body)
    @group = group
    @title = title
    @body = body
    
    mail(
      to: member.email_address,
      subject: "New Event Notice from #{@group.name}"
    )
  end

end