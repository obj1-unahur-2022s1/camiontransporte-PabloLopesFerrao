/*
 * cosas2: Bien. 
 * Faltan los test de camion2 y cosas2
 */

object knightRider {
	/* Bien! */
	method peso() = 500
	method peligrosidad() = 10
	method bulto() = 1
	method sufrirConsecuencia() {}
	

}


object bumblebee {
	/* Bien. Te convendría inicializar la variable booleana esAuto para que siempre
	 * funcionen los métodos bulto() y sufrirConsecuencia(). Acomodo un poco el código para que sea
	 * más legible.
	 */
	var property esAuto = true
	
	method peso() = 800
	
	method peligrosidad() = if (esAuto) {15} else {30}
	method bulto() = 2
	method sufrirConsecuencia() {esAuto = false} 

}


object paqueteLadrillos{
	/* Bien. Te convenía inicializar cantLadrillos por si hay un paquete sin ladrillos. El condicional
	 * en el método bulto() tal vez debía considerar cantLadrillos <= 100 directamente para retornar 1. 
	 * Te dejo otra solución que no usa if. 
	 */
	var property cantLadrillos 
	
	method peso() = cantLadrillos *2
	method peligrosidad() = 2
	
	method bulto() = (2.min(1.max(cantLadrillos-99))).max(3.min(cantLadrillos-298))
	method sufrirConsecuencia() {cantLadrillos += 12}


}



object arena {
	/* Bien. Convenía inicializar peso, y al definir la variable como var property, es innecesario
	 * escribir el método peso(). 
	 */
	var property peso = 0

	method peso() = peso
	method peligrosidad() = 1
	method bulto() = 1
	method sufrirConsecuencia() {peso += 20}
}


object bateriaAntiarea {
	/* Bien(-). Convenía inicializar la variable booleana hayMisiles.
	 * El método bulto() devolvía al revés los valores, te lo corrijo
	 */
	
	var property hayMisiles = false
	
	method peso() = if(hayMisiles) 300 else 200
	
	method peligrosidad() = if(hayMisiles) 100 else 0
	
	method bulto() = if(hayMisiles) {2} else {1}
	
	method sufrirConsecuencia() {hayMisiles = true}
}


object contenedor {
	/* Bien. cosasDentro podría haber sido una constante, ya que el enunciado no propone ninguna
	 * situación en la que la variable que apunta a la lista pueda apuntar a otra lista o referencia.
	 * Y solo como sugerencia, tal vez podrías haber hecho un método auxiliar
	 * para obtener el objeto (cosa) más peligroso de la lista de cosas y luego usarlo en
	 * nivelPeligrosidad(), y ahí queda más simplificada la expresión. Te dejo escrito
	 * en el código.
	 */
	const cosasDentro = []
	
	method cosasDentro(cosa) = cosasDentro.add(cosa)
	
	method cosasDentro() = cosasDentro
	
	method peso() = 100 + cosasDentro.sum({c => c.peso() })
	
	method peligrosidad() = if (cosasDentro.isEmpty()){0}
							else{self.cosaMasPeligrosa().peligrosidad()}
	
	method cosaMasPeligrosa() = cosasDentro.max( { c => c.peligrosidad() } )
	
	method bulto() = 1 + cosasDentro.sum({c => c.bulto()})
	
	method sufrirConsecuencia() = cosasDentro.forEach( {c => c.sufrirConsecuencia()} )
	
}


object residuosRadioactivos {
	/* Bien. Te dejo inicializada la variable */
	var property peso = 0
	
	method peligrosidad() = 200
	method bulto() = 1
	
	method sufrirConsecuencia() {peso += 15}

}

object embalajeSeguridad {
	/* Bien! */
	var property cosaEnvuelta
	
	method peso() = cosaEnvuelta.peso()
	
	method peligrosidad() = cosaEnvuelta.peligrosidad() / 2
	
	method bulto() = 2
	
	method sufrirConsecuencia() {}
}




