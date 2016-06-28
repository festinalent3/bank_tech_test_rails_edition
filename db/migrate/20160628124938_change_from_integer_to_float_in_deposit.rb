class ChangeFromIntegerToFloatInDeposit < ActiveRecord::Migration
  def change
    change_column :deposits, :amount, :float
  end
end
