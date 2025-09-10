class CreateUsers < ActiveRecord::Migration[7.1]
  def change
    create_table :users, if_not_exists: true do |t|
      t.string :name, null: false
      t.string :email, null: false
      t.string :encrypted_password, null: false, default: ""
      t.string   :reset_password_token
      t.datetime :reset_password_sent_at
      t.datetime :remember_created_at
      t.timestamps
    end

    # 既存インデックスがなければ追加
    unless index_exists?(:users, :email, unique: true)
      add_index :users, :email, unique: true
    end

    unless index_exists?(:users, :reset_password_token, unique: true)
      add_index :users, :reset_password_token, unique: true
    end
  end
end
