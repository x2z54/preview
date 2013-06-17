class Student < ActiveRecord::Base
  attr_accessible :email
  has_many :student_rooms
  has_many :rooms, through: :student_rooms

def self.search(search)
  if search
    where('email LIKE ?', "%#{search}%")
  else
    scoped
  end
end

end
