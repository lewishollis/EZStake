class UserSweepstake < ApplicationRecord
  belongs_to :user
  belongs_to :sweepstake
  # Add an 'admin' boolean attribute to indicate admin status
  attribute :admin, :boolean, default: false
end
