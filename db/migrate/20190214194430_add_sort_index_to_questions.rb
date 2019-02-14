class AddSortIndexToQuestions < ActiveRecord::Migration[5.2]
  def change
    add_column :questions, :sort_index, :integer, default: 1
  end
end
