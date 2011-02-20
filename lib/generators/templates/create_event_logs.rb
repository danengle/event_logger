class CreateEventLogs < ActiveRecord::Migration
  def self.up
    create_table :event_logs do |t|
      t.integer :user_id, :null => false
      t.string :controller_name, :action_name
      t.string :event, :item_type, :null => false
      t.integer :item_id, :null => false
      t.timestamps
    end
    add_index :event_logs, [:user_id, :created_at]
  end

  def self.down
    drop_table :event_logs
  end
end
