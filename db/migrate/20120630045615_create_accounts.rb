class CreateAccounts < ActiveRecord::Migration
  def change
    create_table :accounts do |t|
      t.integer :account_number
      t.integer :balance
      t.integer :user_id
      t.string :name

      t.timestamps
    end
  end
end
