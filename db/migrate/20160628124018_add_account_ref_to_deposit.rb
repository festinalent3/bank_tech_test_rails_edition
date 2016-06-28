class AddAccountRefToDeposit < ActiveRecord::Migration
  def change
    add_reference :deposits, :account, index: true, foreign_key: true
  end
end
