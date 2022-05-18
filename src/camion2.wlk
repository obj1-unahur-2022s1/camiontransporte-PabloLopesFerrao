/*
 * Bien. la lista de cosas que carga el camión podría ser una constante, ya que el enunciado 
 * no propone ninguna situación en la que la variable que apunta a la lista pueda apuntar a 
 * otra lista o referencia. 
 * Y te dejo algunas correcciones sobre métodos con lo que se esperaba como solución. Es
 * importante reutilizar otros métodos y respetar la idea de objeto.mensaje(). 
 */
  
import cosas2.*

object camion {
	const cosas = []
	const tara = 1000
	const pesoMax = 2500
	
	method cosas() = cosas
	
	method cargar(cosa){
		cosas.add(cosa)
		cosa.sufrirConsecuencia()
		
	} 
	
	method descargar(cosa) = cosas.remove(cosa)
	
	method todoPesoPar() = cosas.all( {c => c.peso().even() } ) // Otra forma más orientada a objetos
	
	method hayAlgunoQuePesa(peso) = cosas.any( { c => c.peso() == peso } ) 
	
	method elDeNivel(nivel) = cosas.find({c => c.peligrosidad() == nivel})

	method pesoTotal() = tara + cosas.sum({c => c.peso()} )
	
	method excedidoDePeso() = cosas.sum({c => c.peso()} )> pesoMax
	
	method objetosQueSuperanPeligrosidad(nivel) = cosas.filter({c => c.peligrosidad() > nivel})
	
	method objetosMasPeligrososQue(cosa) = cosas.filter({c => c.peligrosidad() > cosa.peligrosidad()})
	
	method puedeCircularEnRuta(nivelMaximoPeligrosidad) = not self.excedidoDePeso() 
			&& self.objetosQueSuperanPeligrosidad(nivelMaximoPeligrosidad).isEmpty()
	
	method tieneAlgoQuePesaEntre(min, max) =  cosas.any( { c => c.peso().between(min,max) } )
	
	method cosaMasPesada() = cosas.max( { c => c.peso() } )
	
	method pesos() = cosas.map( {c => c.peso()}) //No se pedía devolver un conjunto, sino todos los pesos
	
	method totalBultos() = cosas.sum({c => c.bulto()})
	


}
