class CreateNotes < ActiveRecord::Migration[7.0]
  def change
    create_table :notes do |t|
      t.text :body
      t.references :recruitment_company, null: false, foreign_key: true
      t.references :recruiter, null: false, foreign_key: true
      t.references :candidate, null: false, foreign_key: true
      t.bigint :tenant_id

      t.timestamps
    end
  end
end
