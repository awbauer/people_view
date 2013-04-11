class AddExpiresAtToCredentials < ActiveRecord::Migration
  def change
    change_table :credentials do |t|
      t.datetime :expires_at
    end
  end
end
