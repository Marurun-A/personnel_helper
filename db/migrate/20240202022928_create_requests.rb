class CreateRequests < ActiveRecord::Migration[6.1]
  def change
    create_table :requests do |t|
      t.string :name, null: false
      t.string :kana, null: false
      t.string :business
      t.text :introduction, null: false
      t.date :date, null: false
      t.time :start_time, null: false
      t.time :finish_time, null: false
      t.text :place, null: false
      t.string :contact_address
      t.integer :staff_id
      t.integer :tag_ids
      t.timestamps
    end
  end
end
