require "rails_helper"

RSpec.describe PackageMailer, type: :mailer do
  let!(:user) {create(:user)}
  let!(:package) {create(:package)}

  it 'package_create email is sent' do
    expect {
      perform_enqueued_jobs do
        PackageMailer.with(params: package).package_created.deliver_later
      end
    }.to change { ActionMailer::Base.deliveries.size }.by(1)
  end

  it 'delivered_status email is sent' do
    expect {
      perform_enqueued_jobs do
        PackageMailer.with(params: package).delivered_status.deliver_later
      end
    }.to change { ActionMailer::Base.deliveries.size }.by(1)
  end

  it 'sent_status email is sent' do
    expect {
      perform_enqueued_jobs do
        PackageMailer.with(params: package).sent_status.deliver_later
      end
    }.to change { ActionMailer::Base.deliveries.size }.by(1)
  end

  it 'send email after new package was created' do
    expect {
      perform_enqueued_jobs do
        Package.create(name:'sanya', midname: 'ivanovich', surname: 'test', phone: '8138213', email: 'yamamoto@gmail.ru', 
          width: 100, length: 100, height: 100, size: 100, price: 200, weight: 100, addr_to:  "Moscow", addr_from: "Berlin" )
      end
    }.to change { ActionMailer::Base.deliveries.size }.by(1)
  end

  it 'email sent after package correctly change status' do 
    expect {
      perform_enqueued_jobs do
        package.package_delivered!
        puts ActionMailer::Base.deliveries.size
      end 
    }.to change { ActionMailer::Base.deliveries.size }.by(1)
  end
end