class CreateGroupSweepstakes < ActiveRecord::Migration[7.0]
  def change
    create_table :group_sweepstakes do |t|
      t.references :admin, null: false, foreign_key: true
      t.references :group, null: false, foreign_key: true
      t.references :sweepstake, null: false, foreign_key: true

      t.timestamps
    end
  end
end
