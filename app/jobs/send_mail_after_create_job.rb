class SendMailAfterCreateJob < ApplicationJob
  queue_as :default

  def perform(params)
    PackageMailer.with(params: params).package_created.deliver_now
  end
end