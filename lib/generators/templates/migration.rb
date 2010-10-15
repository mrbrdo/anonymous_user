class CreateAnonymousUsers < ActiveRecord::Migration
  def self.up
    create_table :anonymous_users do |t|
      t.string :ip
      t.string :cookie_token

      t.timestamps
    end
  end

  def self.down
    drop_table :anonymous_users
  end
end
