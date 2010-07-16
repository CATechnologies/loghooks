class AddHeadersToEvents < ActiveRecord::Migration
  def self.up
    add_column :events, :headers, :text
  end

  def self.down
    remove_column :events, :headers
  end
end
