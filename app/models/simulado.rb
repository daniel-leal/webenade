class Simulado < ActiveRecord::Base

	def gerar_simulado(curso_id, qtd_questao)
		Question.where(course_id: curso_id).order("RAND()").first(qtd_questao)
	end

end
