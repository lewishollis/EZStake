class Admin < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

    has_one_attached :avatar
    has_many :group_sweepstakes
    has_many :sweepstakes, through: :group_sweepstakes
end
