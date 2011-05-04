class CreateCurves < ActiveRecord::Migration
  def self.up
    create_table :curves do |t|
      t.integer  :graph_id
      t.string   :label
      t.string   :color
      t.string   :symbol

      t.timestamps
    end

  end

  def self.down
    drop_table :curves
  end
end
