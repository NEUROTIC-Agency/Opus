class CreateJobApplications < ActiveRecord::Migration[7.0]
  def change
    create_table :job_applications do |t|
      t.string :status, null: false, default: "Applied"
      t.boolean :seen, null: false, default: false
      t.boolean :dealt_with, null: false, default: false
      t.references :job, null: false, foreign_key: true
      t.references :candidate, null: false, foreign_key: true
      t.references :recruitment_company, null: false, foreign_key: true
      t.references :recruiter, null: true, foreign_key: true
      t.bigint :tenant_id

      t.timestamps
    end
  end
end
