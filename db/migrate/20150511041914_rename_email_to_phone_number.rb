class RenameEmailToPhoneNumber < ActiveRecord::Migration
  def change
    rename_column :users, :email, :phone_number
  end
end
