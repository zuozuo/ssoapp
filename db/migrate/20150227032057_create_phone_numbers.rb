class CreatePhoneNumbers < ActiveRecord::Migration
  def change
    create_table :phone_numbers do |t|
      t.string :phone
      t.integer :user_id
      t.integer :verify_code

      t.timestamps null: false
    end
    add_index :phone_numbers, :phone
    add_index :phone_numbers, :user_id
  end
end
