class AddProjectIdToInvestments < ActiveRecord::Migration
  def self.up
    add_column :investments, :project_id, :integer
  end

  def self.down
    remove_column :investments, :project_id
  end
end
