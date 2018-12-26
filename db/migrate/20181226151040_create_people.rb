class CreatePeople < ActiveRecord::Migration[5.2]
  def change
    create_table :people do |t|
      t.string :name
      t.string :profession
      t.belongs_to :location, foreign_key: true
      t.integer :level

      t.timestamps
    end
  end
end
