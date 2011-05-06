class AddDatesToGraph < ActiveRecord::Migration
  def self.up
    add_column :graphs, :start_at, :datetime
    add_column :graphs, :end_at, :datetime
  end

  def self.down
  end
end
