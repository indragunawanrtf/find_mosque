class CreateContributorUpdates < ActiveRecord::Migration[5.1]
  def change
    create_table :contributor_updates do |t|
      t.integer :user_id
      t.integer :contentable_id
      t.string :contentable_type

      t.timestamps
    end
  end
end
