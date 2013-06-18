class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.string :assunto
      t.text :enunciado
      t.string :alternativa_a
      t.string :alternativa_b
      t.string :alternativa_c
      t.string :alternativa_d
      t.string :alternativa_e
      t.string :alternativa_correta
      t.string :tags

      t.timestamps
    end
  end
end
