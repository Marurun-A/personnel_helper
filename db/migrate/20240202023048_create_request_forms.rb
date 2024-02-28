class CreateRequestForms < ActiveRecord::Migration[6.1]
  def change
    create_table :request_forms do |t|
      t.integer :request_id, null: false
      t.integer :company_id, null: false
      t.integer :staff_id, null: false
      t.date :date
      t.time :start_time
      t.time :finish_time
      t.time :response_deadline
      t.timestamps
    end
  end
end
