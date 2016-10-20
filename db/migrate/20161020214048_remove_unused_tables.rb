class RemoveUnusedTables < ActiveRecord::Migration
  def up
    drop_table :answers
    drop_table :questions
  end

  def down
    create_table :questions do |t|
      t.text :question
      t.timestamps
    end

    create_table :answers do |t|
      t.text :question
      t.belongs_to :question, foreign_key: true
      t.timestamps
    end
  end
end
