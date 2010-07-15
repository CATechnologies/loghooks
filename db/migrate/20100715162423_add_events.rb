class AddEvents < ActiveRecord::Migration
  def self.up
    create_table :events do |t|
      t.string :service
      t.text :add_events, :payload
    end
  end

  def self.down
    drop_table :events
  end
end
