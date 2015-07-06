class AddQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.column :question_title, :string
      t.column :question_body, :string
      t.column :question_author, :string
      t.column :question_score, :integer
    end

    create_table :answers do |t|
      t.column :answer_body, :string
      t.column :answer_author, :string
      t.column :answer_score, :integer
    end
  end
end
