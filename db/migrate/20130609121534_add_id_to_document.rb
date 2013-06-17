class AddIdToDocument < ActiveRecord::Migration
  def change
    add_column :documents, :room_id, :integer
  end
end
