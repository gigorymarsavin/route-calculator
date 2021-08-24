class Package < ApplicationRecord
  validates :name, :midname, :surname, :phone, :email, :width, :length, :height, :addr_from, :addr_to, presence: true
  belongs_to :user

  scope :sorted_by_date_up, lambda { |user|
    where(:user_id => user.id).order(created_at: :asc)
  }

  scope :sorted_by_date_down, lambda { |user|
    where(:user_id => user.id).order(created_at: :desc)
  }

end
