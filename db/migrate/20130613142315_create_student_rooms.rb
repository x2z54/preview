class CreateStudentRooms < ActiveRecord::Migration
  def change
    create_table :student_rooms do |t|
      t.integer :student_id
      t.integer :room_id

      t.timestamps
    end
  end
end
