class CreateEmploymentDetails < ActiveRecord::Migration[6.1]
  def change
    create_table :employment_details do |t|
      t.integer :employment_id, null: false
      t.integer :request_id, null: false
      t.integer :total_payment_amount, null: false
      t.timestamps
    end
  end
end
