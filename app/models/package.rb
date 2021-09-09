class Package < ApplicationRecord
  after_create :mail_after_create_job

  validates :name, :midname, :surname, :phone, :email, :width, :length, :height, :addr_from, :addr_to, presence: true
  validates :phone, numericality: { only_integer: true, message: 'field should be only numbers' }

  belongs_to :user, optional: true

  include AASM

  aasm do
    state :processed, initial: true
    state :sent
    state :delivered

    event :package_sent do
      transitions to: :sent, success: proc {  mail_after_change_status_job }
    end

    event :package_delivered do
      transitions to: :delivered, success: proc { mail_after_change_status_job }
    end
  end

  def mail_after_create_job
    SendMailAfterCreateJob.perform_later(self)
  end

  def mail_after_change_status_job
    SendMailAfterChangeStatusJob.perform_later(self)
  end

end
