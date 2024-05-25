class ApplicationMailer < ActionMailer::Base
  default from: "no-reply@association.com"
  layout "mailer"
end