#ecoding: utf-8
class Question < ActiveRecord::Base
	attr_accessible :alternativa_a, :alternativa_b, :alternativa_c, :alternativa_correta, 
	:alternativa_d, :alternativa_e, :assunto, :enunciado, :tags

	validates_presence_of :alternativa_a, :alternativa_b, :alternativa_c, message: "O campo é obrigatório."
	validates_presence_of :alternativa_correta, :alternativa_d, :alternativa_e, message: "O campo é obrigatório."
	validates_presence_of :assunto, :enunciado, :tags, message: "O campo obrigatório."

end
