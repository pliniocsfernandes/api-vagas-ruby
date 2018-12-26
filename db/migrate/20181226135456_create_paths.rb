class CreatePaths < ActiveRecord::Migration[5.2]
  def change
    create_table :paths do |t|
      t.belongs_to :src, class_name: :location
      t.belongs_to :dst, class_name: :location
      t.integer :distance

      t.timestamps
    end
  end
end
