class AddRoomIdToChatMessage < ActiveRecord::Migration
  def change
    add_column :chat_messages, :room_id, :integer
  end
end
