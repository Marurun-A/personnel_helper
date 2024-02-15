class CreateRecruitments < ActiveRecord::Migration[6.1]
  def change
    create_table :recruitments do |t|
      t.string :name, null: false
      t.string :kana, null: false
      t.string :business, null: false
      t.text :introduction, null: false
      t.integer :hourly_wage, null: false
      t.date :date, null: false
      t.time :time, null: false
      t.text :place, null: false
      t.string :contact_address
      t.integer :company_id
      t.timestamps
    end
  end
end
