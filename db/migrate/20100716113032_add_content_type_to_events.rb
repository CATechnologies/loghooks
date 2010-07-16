class AddContentTypeToEvents < ActiveRecord::Migration
  def self.up
    add_column :events, :content_type, :string
  end

  def self.down
    remove_column :events, :content_type
  end
end
