class AddTimeFailedToTestPassage < ActiveRecord::Migration[5.2]
  def change
    add_column :test_passages, :time_failed, :boolean
  end
end
