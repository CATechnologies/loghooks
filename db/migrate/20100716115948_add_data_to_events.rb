class AddDataToEvents < ActiveRecord::Migration
  def self.up
    add_column :events, :data, :text
  end

  def self.down
    remove_column :events, :data
  end
end
