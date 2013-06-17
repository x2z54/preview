class Room < ActiveRecord::Base
  attr_accessible :description, :title, :ustream_id
  has_many :documents
  has_many :chat_messages
  has_many :student_rooms
  has_many :students, through: :student_rooms
end
