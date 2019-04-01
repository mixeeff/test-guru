class AddTestResultToTestPassage < ActiveRecord::Migration[5.2]
  def change
    add_column :test_passages, :test_result, :integer, default: 0
  end
end
