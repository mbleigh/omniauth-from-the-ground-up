class CreateStatements < ActiveRecord::Migration
  def self.up
    create_table :statements do |t|
      t.string :text

      t.timestamps
    end
  end

  def self.down
    drop_table :statements
  end
end
