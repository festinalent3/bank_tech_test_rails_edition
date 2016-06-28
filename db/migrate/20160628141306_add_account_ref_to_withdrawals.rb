class AddAccountRefToWithdrawals < ActiveRecord::Migration
  def change
    add_reference :withdrawals, :account, index: true, foreign_key: true
  end
end
