class Package < ApplicationRecord
  include AASM 
  validates :name, :midname, :surname, :phone, :email, :width, :length, :height, :addr_from, :addr_to, presence: true
  validates :phone, numericality: { only_integer: true, message: 'field should be only numbers' }
  belongs_to :user, optional: true

  aasm do
    state :processed, initial: true
    state :sent
    state :delivered

    event :package_sent do
      transitions to: :sent, success: proc {  sent_event_job }
    end

    event :package_delivered do
      transitions to: :delivered, success: proc { delivered_event_job }
    end
  end

  after_create do    
    PackageMailer.with(params: self).package_created.deliver!
  end

  def delivered_event_job
    PackageMailer.with(params: self).delivered_status.deliver!
  end

  def sent_event_job
    PackageMailer.with(params: self).sent_status.deliver!
  end

end
