class CreateInvestments < ActiveRecord::Migration
  def self.up
    create_table :investments do |t|
      t.text :name
      t.integer :vote

      t.timestamps
    end
  end

  def self.down
    drop_table :investments
  end
end
