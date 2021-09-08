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
      transitions from: :processed, to: :sent, success: Proc.new { after_change_status_job }
    end 

    event :package_delivered do
      transitions to: :delivered, success: Proc.new { after_change_status_job }
    end
  end

  after_create do
    SendMailAfterCreateJob.perform_later(self)
  end

  def after_change_status_job
    SendMailAfterChangeStatusJob.perform_later(self)
  end


end