class CreateMeetings < ActiveRecord::Migration
  def change
    create_table :meetings do |t|
      t.references :promoter, index: true, foreign_key: true
      t.references :participant, index: true, foreign_key: true
      t.datetime :met_at
      t.integer :promoter_rate
      t.integer :participant_rate

      t.timestamps null: false
    end
  end
end
