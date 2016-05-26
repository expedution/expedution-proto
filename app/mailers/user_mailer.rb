

class UserMailer < ApplicationMailer
  def welcome(user)
    @user = user  # Instance variable => available in view

    mail(to: @user.email, subject: 'Welcome to your learning expedition')
    # This will render a view in `app/views/user_mailer`!
  end

  def expeditioncreation(user)
    @user = user
    mail(to: @user.email, subject: 'Your learning expedition is created')
  end
end
