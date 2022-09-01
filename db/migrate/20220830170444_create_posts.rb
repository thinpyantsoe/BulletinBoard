class CreatePosts < ActiveRecord::Migration[7.0]
  def change
    create_table :posts do |t|
      t.string :title
      t.text :description
      t.boolean :public_flag
      t.bigint :user_id
      t.datetime :deleted_at

      t.timestamps
    end
  end
end
