class DeleteColumnsFromUsers2 < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :login
    remove_column :users, :password
  end
end
