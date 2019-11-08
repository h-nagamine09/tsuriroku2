class CreateRecords < ActiveRecord::Migration[5.2]
  def change
    create_table :records do |t|
      t.string :name
      t.string :size
      t.string :weight
      t.string :place
      t.string :lure
      t.string :weather
      t.string :image
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
