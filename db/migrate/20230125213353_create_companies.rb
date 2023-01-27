class CreateCompanies < ActiveRecord::Migration[7.0]
  def change
    create_table :companies do |t|
      t.string :name
      t.boolean :subscribed, default: false
      t.string :plan, default: 'Free'
      t.text :description
      t.integer :employees_count
      t.string :website
      t.string :location
      t.boolean :hidden, default: true
      t.string :currency
      t.string :subdomain, null: false, unique: true
      t.boolean :terms_of_service, default: true

      t.timestamps
    end
  end
end
