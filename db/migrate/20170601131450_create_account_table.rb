class CreateAccountTable < ActiveRecord::Migration[5.0]
  def change
    create_table :account do |t|
      t.string :username
      t.string :password_digest
    end
  end
end
