import profesionales.*
import universidad.*
import solicitantes.*
class Empresa {
	const profesionales = #{}
	const clientes = #{}
	var property honorariosDeReferencia = 0
	
	
	method agregarProfesional(unProfesional){
		profesionales.add(unProfesional)
	}

	method quitarProfesional(unProfesional){
		profesionales.remove(unProfesional)
	}

	method cuantosEstudiaronEn(unaUniversidad)=
		profesionales.count({p => p.universidad() == unaUniversidad})		

	method profesionalesCaros()= profesionales.filter({ p=> p.honorarios() > honorariosDeReferencia })

	method universidadesFormadoras()= profesionales.map({p=> p.universidad()}).asSet()
	
	method profesionalMasBarato()= profesionales.min({p=> p.honorarios()})	
	
	method esDeGenteAcotada()= profesionales.all({ p=> p.puedeTrabajar().size() <= 3})

	method puedeSatisfacer(unSolicitante)= profesionales.any({p=> unSolicitante.puedeSerAtendido(p)})	


	method darServicio(unSolicitante){
		if(! self.puedeSatisfacer(unSolicitante)){
			self.error("No puede ser atendido")
		}
		else{
 			const profesionalQueAtiende  = profesionales.filter({ p=> unSolicitante.puedeSerAtendido(p)}).anyOne()
		profesionalQueAtiende.cobrar(profesionalQueAtiende.honorarios())
		clientes.add(unSolicitante)
		}
	}

	method cantidadClientes()= clientes.size()
	method esCliente(unCliente)= clientes.contains(unCliente)
}