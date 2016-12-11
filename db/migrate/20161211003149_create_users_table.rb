class CreateUsersTable < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :full_name, null:false
      t.text :email, null: false
      t.text :password_hash, null: false

      t.timestamps
    end
  end
end
