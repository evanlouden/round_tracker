class AuthenticationMailer < ApplicationMailer
  default from: 'no_replay@roundtracker'

  def authentication
    @user = params[:user]
    mail(to: @user.email, subject: 'Round Tracker login link')
  end
end
