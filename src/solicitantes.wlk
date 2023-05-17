import profesionales.*

class Persona {
	var property provinciaDondeVive
	
	method puedeSerAtendido(unProfesional)=
		unProfesional.puedeTrabajar().contains(provinciaDondeVive)
	
}

class Institucion{
	const property universidadesQueReconoce = #{}
	
	method agregarUniversidad(unaUniversidad){
		universidadesQueReconoce.add(unaUniversidad)
	}
	
	method puedeSerAtendido(unProfesional)=
		universidadesQueReconoce.contains(unProfesional.universidad())	
}



// extra. Un profesional que pueda trabajar en las provincias que reconoce el club.

class Club{
	const property provinciasQueReconoce = #{}
	
	method puedeSerAtendido(unProfesional)=
		provinciasQueReconoce.intersection(unProfesional.puedeTrabajar()).size() > 0
}