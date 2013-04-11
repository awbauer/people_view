class AddRefreshTokenToCredentials < ActiveRecord::Migration
  def change
    change_table :credentials do |t|
      t.string :refresh_token
    end
  end
end
