object knightRider {
	
	method peso() = 500
	method peligrosidad() = 10
	method bulto() = 1
	method sufrirConsecuencia() {}
	

}


object bumblebee {
	var property esAuto 
	
	method peso() = 800
	
	method peligrosidad() = if (esAuto){
		15
	}else{
		30
	}
	method bulto() = 2
	method sufrirConsecuencia() {esAuto = false} 

}


object paqueteLadrillos{
	var property cantLadrillos 
	
	method peso() = cantLadrillos *2
	method peligrosidad() = 2
	
	method bulto() = if(cantLadrillos >= 1 and cantLadrillos <= 100 ){
		return 1
	}else if(cantLadrillos <= 300){
		return 2
	}else{
		return 3
	}
	method sufrirConsecuencia() {cantLadrillos += 12}


}



object arena {
	var property peso 

	method peso() = peso
	method peligrosidad() = 1
	method bulto() = 1
	method sufrirConsecuencia() {peso += 20}
}


object bateriaAntiarea {
	var property hayMisiles 
	
	method peso() = if(hayMisiles){
		  300
	}else{
		   200
	}
	
	method peligrosidad() = if(hayMisiles){
		   100
	}else{
		  0
	}
	
	method bulto() = if(hayMisiles){
		return 1
	}else{
		return 2
	}
	
	method sufrirConsecuencia() {hayMisiles = true}
}


object contenedor {
	var cosasDentro = []
	
	method cosasDentro(cosas) = cosasDentro.add(cosas)
	
	method cosasDentro() = cosasDentro
	
	method peso() = 100 + cosasDentro.sum({c => c.peso() })
	
	method peligrosidad() = if (cosasDentro.isEmpty()){
		0
	}else{
		cosasDentro.max( { c => c.peligrosidad() } ).peligrosidad()

	}
	
	method bulto() = 1 + cosasDentro.sum({c => c.bulto()})
	
	method sufrirConsecuencia() = cosasDentro.forEach( {c => c.sufrirConsecuencia()} )
	
}


object residuosRadioactivos {
	var property peso
	
	method peligrosidad() = 200
	method bulto() = 1
	
	method sufrirConsecuencia() {peso += 15}

}

object embalajeSeguridad {
	var property cosaEnvuelta
	
	method peso() = cosaEnvuelta.peso()
	
	method peligrosidad() = (cosaEnvuelta.peligrosidad() / 2)
	
	method bulto() = 2
	
	method sufrirConsecuencia() {}
}




