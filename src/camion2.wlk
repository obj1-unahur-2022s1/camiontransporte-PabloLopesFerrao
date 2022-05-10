import cosas2.*

object camion {
	var cosas = []
	const tara = 1000
	const pesoMax = 2500
	
	method cosas() = cosas
	
	method cargar(cosa){
		cosas.add(cosa)
		cosa.sufrirConsecuencia()
		
	} 
	
	method descargar(cosa) = cosas.remove(cosa)
	
	method todoPesoPar() = cosas.all( {c => c.peso() %2 == 0 } )
	
	method hayAlgunoQuePesa(peso) = cosas.any( { c => c.peso() == peso } ) 
	
	method elDeNivel(nivel) = cosas.find({c => c.peligrosidad() == nivel})

	method pesoTotal() = tara + cosas.sum({c => c.peso()} )
	
	method excedidoDePeso() = cosas.sum({c => c.peso()} )> pesoMax
	
	method objetosQueSuperanPeligrosidad(nivel) = cosas.filter({c => c.peligrosidad() > nivel})
	
	method objetosMasPeligrososQue(cosa) = cosas.filter({c => c.peligrosidad() > cosa.peligrosidad()})
	
	method puedeCircularEnRuta(nivelMaximoPeligrosidad) = (cosas.sum({c => c.peso()} )< pesoMax and cosas.filter({c => c.peligrosidad() > nivelMaximoPeligrosidad})) 
	
	method tieneAlgoQuePesaEntre(min, max) =  cosas.any({c => c.peso() > min }) and  cosas.any({c => c.peso() > max })
	
	method cosaMasPesada() = cosas.max( { c => c.peso() } )
	
	method pesos() = cosas.map( {c => c.peso()}).asSet()
	
	method totalBultos() = cosas.sum({c => c.bulto()})
	


}
