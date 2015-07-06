class FixTables < ActiveRecord::Migration
  def change
    remove_column :questions, :question_id
    add_column :answers, :question_id, :integer
  end
end
