class SendMailAfterChangeStatusJob < ApplicationJob
  queue_as :default 

  def perform(params) 
    PackageMailer.with(params: params).send("#{params.aasm_state}_status").deliver_now
  end
end