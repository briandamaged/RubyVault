class ChangeAccountNumberToString < ActiveRecord::Migration
  def up
    change_column :accounts, :account_number, :string
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end
