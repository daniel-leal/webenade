class AddColumnToUser < ActiveRecord::Migration
  def change
  	 add_column :users, :institution, :string
  	 add_column :users, :type, :string
  end
end
