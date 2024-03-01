class CreateEmployments < ActiveRecord::Migration[6.1]
  def change
    create_table :employments do |t|
      t.integer :company_id, null: false
      t.integer :staff_id, null: false
      t.date :response_deadline, null: false
      t.integer :total_payment_amount, null: false
      t.text :introduction, null: false
      t.integer :hourly_wage, null: false
      t.time :hours, nill: false
      t.date :date, null: false
      t.time :start_time, null: false
      t.time :finish_time, null: false
      t.text :place_of_employment, null: false
      t.string :contact_address
      t.integer :payment_method, nill: false
      t.integer :employment_status, nill: false
      t.string :employment_name, nill: false
      t.string :employment_kana, nill: false
      t.timestamps
    end
  end
end
