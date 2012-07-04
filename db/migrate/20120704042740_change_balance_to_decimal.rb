class ChangeBalanceToDecimal < ActiveRecord::Migration
  def up
    # Note: It appears that the scale is not honored by SQLite3.
    #       If necessary, we can deal w/ this in the code.
    change_column :accounts, :balance, :decimal, :precision => 20, :scale => 2
  end

  def down
    change_column :accounts, :balance, :integer
  end
end
