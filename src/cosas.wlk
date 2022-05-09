object knightRider {
	
	method peso() = 500
	method peligrosidad() = 10

}


object bumblebee {
	var property esAuto 
	
	method peso() = 800
	
	method peligrosidad() = if (esAuto){
		15
	}else{
		30
	}

}


object paqueteLadrillos{
	var property cantLadrillos 
	
	method peso() = cantLadrillos *2
	method peligrosidad() = 2

}



object arena {
	var property peso 

	method peso() = peso
	method peligrosidad() = 1

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
	
}


object residuosRadioactivos {
	var property peso
	
	method peligrosidad() = 200

}

object embalajeSeguridad {
	var property cosaEnvuelta
	
	method peso() = cosaEnvuelta.peso()
	
	method peligrosidad() = (cosaEnvuelta.peligrosidad() / 2)
	
}




