class RemoveUsuernameFromUsers < ActiveRecord::Migration[6.1]
  def change
    remove_column :users, :usuername, :string
  end
end
