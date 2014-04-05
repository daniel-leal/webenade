class AddColumnNivelToQuestion < ActiveRecord::Migration
  def change
    add_column :questions, :nivel, :integer
  end
end
