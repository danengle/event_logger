class EventLog < ActiveRecord::Base
  belongs_to :item, :polymorphic => true
  belongs_to :user

  validates_presence_of :item_id, :item_type, :event
end