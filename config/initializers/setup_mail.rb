ActionMailer::Base.smtp_settings = {
  :address => "smtp.gmail.com",
  :port => '587',
  :domain => "thewikifund.com",
  :authentication => :plain,
  :user_name => "the.wiki.fund.info@gmail.com",
  :password => "gjPmuckJ",
#  :enable_starttls_auto => true
}