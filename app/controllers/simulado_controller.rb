class SimuladoController < ApplicationController
	
	def generate
		simulado = Simulado.new
		simulado.gerar_simulado(params[:])
	end

end
