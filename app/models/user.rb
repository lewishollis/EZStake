class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one_attached :avatar
  has_many :user_sweepstakes
  has_many :sweepstakes, through: :user_sweepstakes

  def admin_for_sweepstake?(sweepstake)
    user_sweepstakes.find_by(sweepstake: sweepstake)&.admin || false
  end
end
