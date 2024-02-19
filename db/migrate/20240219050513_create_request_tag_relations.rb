class CreateRequestTagRelations < ActiveRecord::Migration[6.1]
  def change
    create_table :request_tag_relations do |t|
      t.references :request, null: false, foreign_key: true
      t.references :tag, null: false, foreign_key: true

      t.timestamps
    end
  end
end
