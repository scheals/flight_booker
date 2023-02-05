# frozen_string_literal: true

class ApplicationMailer < ActionMailer::Base
  default from: "scheals@flightbooker.pl"
  layout "mailer"
end
