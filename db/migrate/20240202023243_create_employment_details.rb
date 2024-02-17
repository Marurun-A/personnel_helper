class CreateEmploymentDetails < ActiveRecord::Migration[6.1]
  def change
    create_table :employment_details do |t|
      t.integer :employment_id, null: false
      t.integer :request_id, null: false
      t.integer :salary, null: false
      t.integer :number_of_times, null: false
      t.timestamps
    end
  end
end
