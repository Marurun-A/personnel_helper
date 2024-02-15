class CreateWorkDetails < ActiveRecord::Migration[6.1]
  def change
    create_table :work_details do |t|
      t.integer :work_id, null: false
      t.integer :recruitment_id, null: false
      t.integer :salary, null: false
      t.integer :number_of_times, null: false
      t.timestamps
    end
  end
end
