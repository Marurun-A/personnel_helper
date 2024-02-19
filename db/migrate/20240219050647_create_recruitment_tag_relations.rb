class CreateRecruitmentTagRelations < ActiveRecord::Migration[6.1]
  def change
    create_table :recruitment_tag_relations do |t|
      t.references :recruitment, null: false, foreign_key: true
      t.references :tag, null: false, foreign_key: true

      t.timestamps
    end
  end
end
