class Room < ActiveRecord::Base
  attr_accessible :description, :title
  has_many :documents
end
