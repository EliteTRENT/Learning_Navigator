class CreateExams < ActiveRecord::Migration[8.0]
  def change
    create_table :exams do |t|
      t.references :subject, null: false, foreign_key: true

      t.timestamps
    end
  end
end
