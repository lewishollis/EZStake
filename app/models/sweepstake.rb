class Sweepstake < ApplicationRecord
  has_many :user_sweepstakes
  has_many :users, through: :user_sweepstakes


  def add_admin(user)
    user_sweepstakes.create(user: user, admin: true)
  end
end
