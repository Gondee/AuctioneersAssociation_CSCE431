class MemberMailer < ApplicationMailer
 
  def account_activation(member)
    @member = member
    mail to: member.Main_Email, subject: "Account activation"
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.member_mailer.password_reset.subject
  #
   def password_reset(member)
    @member = member
    mail to: member.Main_Email, subject: "Password reset"
   end
  
end
