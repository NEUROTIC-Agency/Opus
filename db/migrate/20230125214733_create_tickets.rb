class CreateTickets < ActiveRecord::Migration[7.0]
  def change
    create_table :tickets do |t|
      t.text :body
      t.references :recruiter, null: false, foreign_key: true
      t.string :status, null: false, default: 'Open'
      t.belongs_to :company, null: false, foreign_key: true

      t.timestamps
    end
  end
end
