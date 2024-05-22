class CreateCompanyNotifications < ActiveRecord::Migration[6.1]
  def change
    create_table :company_notifications do |t|
      t.references :company, null: false, foreign_key: true
      t.integer :staff_id, null: true
      t.references :company_notifiable, polymorphic: true, null: false
      t.boolean :read, default: false, null: false

      t.timestamps
    end
  end
end
