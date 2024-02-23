class AddUserIdToSweepstakes < ActiveRecord::Migration[7.0]
  def change
    add_reference :sweepstakes, :user, null: false, foreign_key: true
  end
end
