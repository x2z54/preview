class CreateChatIdColumnOnChatMessages < ActiveRecord::Migration
  def up
    change_table :chat_messages do |t|
      t.integer :chat_id
    end
  end

  def down
    change_table :chat_messages do |t|
      t.remove :chat_id
    end
  end
end
