class AddUstreamIdToRoom < ActiveRecord::Migration
  def change
    add_column :rooms, :ustream_id, :integer
  end
end
