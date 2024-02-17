class CreateRequestForms < ActiveRecord::Migration[6.1]
  def change
    create_table :request_forms do |t|
      t.integer :request_id, null: false
      t.integer :company_id, null: false
      # t.integer :staff_id, null: false
      # t.integer :number_of_times, null: false
      t.timestamps
    end
  end
end
