class AddBalanceToUsers < ActiveRecord::Migration
  def self.up
    add_column :users, :balance, :float
  end

  def self.down
    remove_column :users, :balance
  end
end
