class CreateBusinessTagRelations < ActiveRecord::Migration[6.1]
  def change
    create_table :business_tag_relations do |t|
      t.references :business, null: false, foreign_key: true
      t.references :tag, null: false, foreign_key: true

      t.timestamps
    end
  end
end
