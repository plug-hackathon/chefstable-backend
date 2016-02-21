class AddDefaultAdminValueToUsers < ActiveRecord::Migration
  def change
    change_column :users, :admin, :boolean, default: false

    User.where(admin: nil).update_all(admin: false)
  end
end
