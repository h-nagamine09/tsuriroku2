class AddPostedAtToRecords < ActiveRecord::Migration[5.2]
  def change
    add_column :records, :posted_at, :datetime
  end
end
