import universidad.*

class Asociado {
	var property universidad

	method puedeTrabajar() { return #{"Entre Rios", "Corrientes", "Santa Fe"} }
	method honorarios()= 3000
	method cobrar(unImporte){
		asociacionProfesionalesDelLitoral.recibirDonacion(unImporte)
	}	
}


class Vinculado {
	var property universidad
	
	method honorarios()= universidad.honorariosRecomendados()
	method puedeTrabajar()= #{universidad.provincia()}
	method cobrar(unImporte){
		universidad.recibirDonacion(unImporte/2)
	}
}


class Libre {
	var totalRecaudado = 0
	var property universidad
	var property honorarios
	var property puedeTrabajar = #{}
	method cobrar(unImporte){
		totalRecaudado+= unImporte
	}
	
	method pasarDinero(unImporte,otroProfesional){
		totalRecaudado = 0.max(totalRecaudado - unImporte)
		otroProfesional.cobrar(unImporte)
	}

}

