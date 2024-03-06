class CreateRequests < ActiveRecord::Migration[6.1]
  def change
    create_table :requests do |t|
      t.string :request_name, null: false
      t.string :request_kana, null: false
      t.text :introduction, null: false
      t.date :start_date, null: false
      t.date :finish_date, null: false
      t.time :start_time, null: false
      t.time :finish_time, null: false
      t.time :maximum_time, null: false
      t.text :place, null: false
      t.string :contact_address, null: false
      t.integer :staff_id, null: false
      t.integer :tag_ids
      t.timestamps
    end
  end
end
