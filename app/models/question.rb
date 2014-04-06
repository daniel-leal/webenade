#ecoding: utf-8
class Question < ActiveRecord::Base
	attr_accessible :alternativa_a, :alternativa_b, :alternativa_c, :alternativa_correta, 
	:alternativa_d, :alternativa_e, :assunto, :enunciado, :tags, :course_id, :nivel

	validates_presence_of :alternativa_a, :alternativa_b, :alternativa_c, message: "O campo é obrigatório."
	validates_presence_of :alternativa_correta, :alternativa_d, :alternativa_e, message: "O campo é obrigatório."
	validates_presence_of :assunto, :enunciado, :nivel, message: "O campo é obrigatório."
	validates_presence_of :course_id, message: "O campo é obrigatório"


	belongs_to :course

	def self.search(search)
	  if search
	  	if search.eql?""
	  		find(:all)
  		else
	    	find(:all, :conditions => ['course_id = ?', "#{search}"])
	    end
	  else
	    find(:all)
	  end
	end


	def self.gerar_simulado(curso, qtd_questao)
		Question.where(course_id: curso).order("RAND()").limit(qtd_questao)
	end
	
	def is_correct?(val)
	  alternativa_correta == val
	end

end
