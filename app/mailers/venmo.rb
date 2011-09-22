class Venmo < ActionMailer::Base
  default :from => "ffmaer@gmail.com"

  def donate(user,dollar,project)
    @user = user
    @dollar = dollar
    @project = project
    mail(:to => user.email, :subject => "Donate $#{dollar} to make #{project} more awesome!")
  end

end
