class CreateRecruitmentForms < ActiveRecord::Migration[6.1]
  def change
    create_table :recruitment_forms do |t|
      t.integer :recruitment_id, null: false
      # t.integer :company_id, null: false
      t.integer :staff_id, null: false
      # t.integer :number_of_times, null: false
      t.timestamps
    end
  end
end
