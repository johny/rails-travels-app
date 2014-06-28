class AppMailer < Devise::Mailer

  default from: 'wloczega@trampa.pl'
  helper :application # gives access to all helpers defined within `application_helper`.
  include Devise::Controllers::UrlHelpers # Optional. eg. `confirmation_url`


  def email_test user
    @user = user
    mail to: @user.email, subject: "Cześć! To jest testowy email!"
  end

end