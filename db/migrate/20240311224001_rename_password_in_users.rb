# db/migrate/[timestamp]_rename_password_in_users.rb Generated by GPT so we can use Rails built-in method for bcrypt later

class RenamePasswordInUsers < ActiveRecord::Migration[7.1]
  def change
    rename_column :users, :password, :password_digest
  end
end
