class CreateAuthTokens < ActiveRecord::Migration[5.1]
  def change
    create_table :auth_tokens do |t|
      t.integer :user_id
      t.text    :device
      t.text    :token
      t.string :os
      t.string :os_version
      t.string :app_version

      t.timestamps
    end

    add_index :auth_tokens, :user_id
  end
end
