class ApplicationMailer < ActionMailer::Base
  default from: "from@example.com"
  layout 'mailer'

  :from => ENV["GMAIL"]
end
