class Universidad {
	var property provincia
	var property honorariosRecomendados
	var donaciones = 0
	
	method donaciones()= donaciones	
	method recibirDonacion(unImporte){
		donaciones += unImporte
	}
}

object asociacionProfesionalesDelLitoral{
	var donaciones = 0
	
	method recibirDonacion(unImporte){
		donaciones += unImporte 
	}
}