class Sweepstake < ApplicationRecord
  belongs_to :user
  has_many :user_sweepstakes
  has_many :users, through: :user_sweepstakes

  def add_admin(user)
    save if new_record?  # Save the sweepstake if it's a new record
    user_sweepstakes.create!(user: user, admin: true, user_id: user.id)
  end

  def add_participant(user, admin = false)
    user_sweepstakes.create(user: user, admin: admin)
  end

end
