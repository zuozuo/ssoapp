class AddVerifiedToPhoneNumber < ActiveRecord::Migration
  def change
    add_column :phone_numbers, :verified, :boolean
  end
end
