class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.string :fullname
      t.integer :ages
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
