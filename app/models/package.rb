class Package < ApplicationRecord
  validates :name, :midname, :surname, :phone, :email, :width, :length, :height, :addr_from, :addr_to, presence: true
  belongs_to :user
end
