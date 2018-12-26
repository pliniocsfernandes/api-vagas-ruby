class CreateJobApplications < ActiveRecord::Migration[5.2]
  def change
    create_table :job_applications do |t|
      t.belongs_to :person, foreign_key: true
      t.belongs_to :job_opportunity, foreign_key: true

      t.timestamps
    end
  end
end
