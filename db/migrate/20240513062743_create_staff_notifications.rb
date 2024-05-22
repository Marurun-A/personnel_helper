class CreateStaffNotifications < ActiveRecord::Migration[6.1]
  def change
    create_table :staff_notifications do |t|
      t.references :staff, null: false, foreign_key: true
      t.integer :company_id, null: true
      t.references :staff_notifiable, polymorphic: true, null: false
      t.boolean :read, default: false, null: false

      t.timestamps
    end
  end
end
