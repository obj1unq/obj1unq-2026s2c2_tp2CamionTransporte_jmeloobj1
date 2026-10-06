object knightRider {
	method peso() = 500
	
	method nivelPeligrosidad() = 10
	
	method cantidadDeBultos() = 1
	
	method accidente() {
		
	}
}

object arenaAGranel {
	var property peso = 0
	
	method nivelPeligrosidad() = 1
	
	method cantidadDeBultos() = 1
	
	method accidente() {
		self.peso(peso + 20)
	}
}

object paqueteDeLadrillos {
	var property ladrillos = 0
	
	method peso() = ladrillos * self.pesoDeLadrillo()
	
	method nivelPeligrosidad() = 2
	
	method pesoDeLadrillo() = 2

	
	method cantidadDeBultos() = if (ladrillos <= 100) {
		1
	} else {
		if (ladrillos <= 300) 2 else 3
	}
	
	method accidente() {
		if (ladrillos > 12) self.ladrillos(ladrillos - 12) else self.ladrillos(0)
	}
}

object residuosRadiactivos {
	var property peso = 0
	
	method nivelPeligrosidad() = 200
	
	method cantidadDeBultos() = 1
	
	method accidente() {
		self.peso(peso + 15)
	}
}

object bateriaAntiaerea {
	var property misiles = conMisiles
	var property cantidadMisiles = 0 
	
	method peso() = misiles.peso()
	
	method nivelPeligrosidad() = misiles.nivelPeligrosidad()
	
	
	method cantidadDeBultos() = misiles.bultos()
	
	method accidente() {
		cantidadMisiles = 0
		self.misiles(sinMisiles)
	}
	//correcion (feedback)
} //objetos que son usados en bateriaAntiaerea:

object conMisiles {
	method peso() = 300
	
	method nivelPeligrosidad() = 100
	
	method cantidadDeBultos() = 2
}

object sinMisiles {
	method peso() = 200
	
	method nivelPeligrosidad() = 0
	
	method cantidadDeBultos() = 1
} //Aca finaliza

object bumblebee {
	var property transformacion = transformadoEnAuto
	
	method peso() = 800
	
	method nivelPeligrosidad() = transformacion.nivelPeligrosidad()
	
	
	method cantidadDeBultos() = 2
	
	method transformarse() {
	  transformacion = transformacion.otroModo()
	}

	method accidente() {
	  self.transformarse()
	}

	
 } //objetos que son usados en bumblebee

object transformadoEnAuto {
	method nivelPeligrosidad() = 15
	method otroModo() {
	  return transformadoEnRobot
	}
}

object transformadoEnRobot {
	method nivelPeligrosidad() = 30
	method otroModo() {
	  return transformadoEnAuto
	}
}

object contenedorPortuario {
	const cosasDentro = #{}
	
	method peso() = 100 + cosasDentro.sum({ objeto => objeto.peso() })
	
	method nivelPeligrosidad() = if (cosasDentro.isEmpty()) 0
	                             else self.peligrosidadDelContenidoMasPeligroso()
	
	method peligrosidadDelContenidoMasPeligroso() = cosasDentro.map(
		{ cosa => cosa.nivelPeligrosidad() }
	).max()
	
	method cantidadDeBultos() = cosasDentro.sum({ cosa => cosa.cantidadDeBultos() }) + 1
	//correcion (feedback)
	
	method accidente() {
		cosasDentro.forEach({ cosa => cosa.accidente() })
	}
}

object embalajeDeSeguridad {
	var property envuelto = bumblebee
	
	method peso() = envuelto.peso()
	
	method nivelPeligrosidad() = envuelto.nivelPeligrosidad() / 2
	
	method cantidadDeBultos() = 2
	
	method accidente() {
		
	}
}

