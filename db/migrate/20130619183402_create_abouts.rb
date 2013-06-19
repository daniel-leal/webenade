class CreateAbouts < ActiveRecord::Migration
  def change
    create_table :abouts do |t|
      t.text :conteudo

      t.timestamps
    end
  end
end
