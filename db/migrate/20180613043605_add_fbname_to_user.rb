class AddFbnameToUser < ActiveRecord::Migration[5.2]
  def change
  	add_column :users, :fbname, :string
  end
end
