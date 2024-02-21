class CreateRecruitmentForms < ActiveRecord::Migration[6.1]
  def change
    create_table :recruitment_forms do |t|
      t.integer :recruitment_id, null: false
      t.integer :staff_id, null: false
      t.date :date
      t.time :start_time
      t.time :finish_time
      t.time :response_deadline
      t.timestamps
    end
  end
end
