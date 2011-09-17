class ChangeProjectFundType < ActiveRecord::Migration
  def self.up
    remove_column :projects, :fund
    add_column :projects, :fund, :float
  end

  def self.down
    remove_column :projects, :fund
    add_column :projects, :fund, :integer
  end
end
