class ChatMessage < ActiveRecord::Base
  HISTORY = 20
  attr_accessor :message, :created_at, :room_id, :name, :chat_id

  belongs_to :room

  def initialize(message, name, created_at=Time.now, chat_id)
    @message = message
    @name = name
    @created_at = created_at
    @chat_id = chat_id.to_s
    self.class.push self
  end

  def self.push(chat_message)
    @chat_messages ||= []
    @chat_messages << chat_message
    @chat_messages = @chat_messages.reverse.take(HISTORY).reverse
  end

  # def self.get_all
  #   @chat_messages ||= []
  # end

  def self.get_room_messages(chatid)
    @chat_messages ||= []
    @chat_messages.select {|m| m.chat_id == chatid.to_s}
  end
end
