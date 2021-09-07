class Package < ApplicationRecord
  include AASM 
  validates :name, :midname, :surname, :phone, :email, :width, :length, :height, :addr_from, :addr_to, presence: true
  validates :phone, numericality: { only_integer: true, message: 'field should be only numbers' }
  belongs_to :user, optional: true

  aasm do
    state :processed, initial: true
    state :sent
    state :delivered

    event :sent_package do
      transitions from: [:processed], to: :sent
    end

    event :delivered do
      transitions from: [:sent], to: :delivered
    end

  end
end
