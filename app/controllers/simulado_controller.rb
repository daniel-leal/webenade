class SimuladoController < ApplicationController
	def create
		simulado = Simulado.new
		simulado.gerar_simulado()
	end
end
