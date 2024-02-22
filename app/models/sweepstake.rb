class Sweepstake < ApplicationRecord
  has_many :user_sweepstakes
  has_many :users, through: :user_sweepstakes
end
