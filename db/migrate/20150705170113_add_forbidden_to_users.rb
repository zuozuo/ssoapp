class AddForbiddenToUsers < ActiveRecord::Migration
  def change
    add_column :users, :forbidden, :boolean, default: false
  end
end
