class StudentRoom < ActiveRecord::Base
  attr_accessible :room_id, :student_id
  belongs_to :student
  belongs_to :room
end
