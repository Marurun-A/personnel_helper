class CreateEmployments < ActiveRecord::Migration[6.1]
  def change
    create_table :employments do |t|
      t.integer :company_id, null: false
      t.date :response_deadline, null: false
      t.integer :total_amount, null: false
      t.integer :transportation_expenses, null: false
      t.integer :payment_method, null: false
      t.timestamps
    end
  end
end
