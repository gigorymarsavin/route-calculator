class Package < ApplicationRecord
  include AASM

  aasm do
  end
  include AASM

  validates :name, :midname, :surname, :phone, :email, :width, :length, :height, :addr_from, :addr_to, presence: true
  belongs_to :user

  aasm do
    state :processed, initial: true
    state :sent
    state :finished

    event :sent_package do
      transitions from: [:processed], to: :sent
    end

    event :delivered do
      transitions from: [:sent], to: :finished
    end

  end
end
