class CreateRecruitments < ActiveRecord::Migration[6.1]
  def change
    create_table :recruitments do |t|
      t.string :recruitment_name, null: false
      t.string :recruitment_kana, null: false
      t.text :introduction, null: false
      t.integer :hourly_wage, null: false
      t.date :start_date, null: false
       t.date :finish_date, null: false
      t.time :start_time, null: false
      t.time :finish_time, null: false
      t.time :minimum_time, null: false
      t.text :place, null: false
      t.string :contact_address, null: false
      t.integer :company_id, null: false
      t.integer :tag_ids
      t.timestamps
    end
  end
end
