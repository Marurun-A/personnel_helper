class CreateWorks < ActiveRecord::Migration[6.1]
  def change
    create_table :works do |t|
      t.integer :staff_id, null: false
      t.integer :company_id, null: false
      t.date :response_deadline, null: false
      t.integer :total_payment_amount, null: false
      t.text :introduction, null: false
      t.text :transportation, null: false
      t.time :hours, null: false
      t.date :date, null: false
      t.time :start_time, null: false
      t.time :finish_time, null: false
      t.text :whereabouts, null: false
      t.string :contact_address, null: false
      t.integer :payment_method, null: false
      t.timestamps
    end
  end
end
