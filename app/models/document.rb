class Document < ActiveRecord::Base
  attr_accessible :link, :name, :room_id
  belongs_to :room
end
