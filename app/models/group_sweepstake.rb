class GroupSweepstake < ApplicationRecord
  belongs_to :admin
  belongs_to :group
  belongs_to :sweepstake
end
