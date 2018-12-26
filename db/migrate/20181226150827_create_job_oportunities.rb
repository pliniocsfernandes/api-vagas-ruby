class CreateJobOportunities < ActiveRecord::Migration[5.2]
  def change
    create_table :job_opportunities do |t|
      t.string :company
      t.string :title
      t.text :description
      t.belongs_to :location, foreign_key: true
      t.integer :level

      t.timestamps
    end
  end
end
