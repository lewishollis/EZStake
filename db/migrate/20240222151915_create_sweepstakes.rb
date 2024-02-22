class CreateSweepstakes < ActiveRecord::Migration[6.0]
  def change
    create_table :sweepstakes do |t|
      t.string :name
      t.text :description
      t.datetime :start_date
      t.datetime :end_date
      t.string :api_url
      t.timestamps
    end
  end
end
