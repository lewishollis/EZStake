class UserSweepstake < ApplicationRecord
  belongs_to :user
  belongs_to :sweepstake
end
