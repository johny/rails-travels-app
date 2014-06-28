class AppMailerPreview < ActionMailer::Preview

  def email_test
    AppMailer.email_test mock_user
  end

  ## preview devise emails
  def confirmation_instructions
    AppMailer.confirmation_instructions(mock_user, {})
  end

  def reset_password_instructions
    AppMailer.reset_password_instructions(mock_user, {})
  end

  def unlock_instructions
    AppMailer.unlock_instructions(mock_user, {})
  end


  private
    def mock_user
      user = User.new({name: "Jan Kraus", email: "kraus.jan@gmail.com", password: Devise.friendly_token})
    end

end