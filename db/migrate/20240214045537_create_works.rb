class CreateWorks < ActiveRecord::Migration[6.1]
  def change
    create_table :works do |t|
      t.integer :staff_id, null: false
      t.date :response_deadline, null: false
      t.integer :payment, null: false
      t.timestamps
    end
  end
end
