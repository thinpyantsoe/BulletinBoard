class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :name, null: false, unique: true
      t.string :email, null: false, unique: true
      t.text :password, null: false
      t.boolean :super_user_flag
      t.string :role, limit: 1
      t.string :phone
      t.string :address
      t.date :birthday
      t.datetime :deleted_at

      t.timestamps
    end
  end
end
