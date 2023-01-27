class CreateJobs < ActiveRecord::Migration[7.0]
  def change
    create_table :jobs do |t|
      t.string :title
      t.string :salary
      t.string :employment_type
      t.string :location
      t.text :role_description
      t.text :requirements
      t.text :benefits
      t.text :interview_process
      t.string :contact
      t.date :expiry_date
      t.string :status
      t.boolean :searchable, default: false
      t.belongs_to :company, null: false, foreign_key: true

      t.timestamps
    end
  end
end
