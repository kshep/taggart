class CreateGraphs < ActiveRecord::Migration
  def self.up
    create_table :graphs do |t|
      t.integer   :user_id
      t.text      :keys 

      t.timestamps
    end
  end

  def self.down
    drop_table :graphs
  end
end
