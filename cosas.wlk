object knightRider {
	method peso() = 500
	
	method nivelPeligrosidad() = 10
	
	method cantidadDeBultos() = 1
	
	method accidente() {
		
	}
}

object arenaAGranel {
	var peso = 0
	
	method peso(_peso) {
		peso = _peso
	}
	
	method peso() = peso
	
	method nivelPeligrosidad() = 1
	
	method cantidadDeBultos() = 1
	
	method accidente() {
		self.peso(peso + 20)
	}
}

object paqueteDeLadrillos {
	var ladrillos = 0
	
	method ladrillos(_ladrillos) {
		ladrillos = _ladrillos
	}
	
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
	var peso = 0
	
	method peso(_peso) {
		peso = _peso
	}
	
	method peso() = peso
	
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
	
	method bultos() = 2
}

object sinMisiles {
	method peso() = 200
	
	method nivelPeligrosidad() = 0
	
	method cantidadDeBultos() = 1
} //Aca finaliza

object bumblebee {
	var transformacion = transformadoEnAuto
	
	method transformacion(_transformacion) {
		transformacion = _transformacion
	}
	
	method peso() = 800
	
	method nivelPeligrosidad() = transformacion.peligrosidad()
	
	
	method cantidadDeBultos() = 2
	
	method accidente() {
		transformacion = transformacion.tranformarse()
	}
 } //objetos que son usados en bumblebee

object transformadoEnAuto {
	method peligrosidad() = 15
	method tranformarse() {
	  return transformadoEnRobot
	}
}

object transformadoEnRobot {
	method peligrosidad() = 30
	method tranformarse() {
	  return transformadoEnAuto
	}
}

object contenedorPortuario {
	const objetosDentro = #{}
	
	method peso() = 100 + objetosDentro.sum({ objeto => objeto.peso() })
	
	method nivelPeligrosidad() = if (objetosDentro.isEmpty()) 0
	                             else self.peligrosidadDelContenidoMasPeligroso()
	
	method peligrosidadDelContenidoMasPeligroso() = objetosDentro.map(
		{ cosa => cosa.nivelPeligrosidad() }
	).max()
	
	method cantidadDeBultos() = objetosDentro.sum({ cosa => cosa.cantidadDeBultos() }) + 1
	//correcion (feedback)
	
	method accidente() {
		objetosDentro.forEach({ cosa => cosa.accidente() })
	}
}

object embalajeDeSeguridad {
	var envuelto = bumblebee
	
	method envuelto(_envuelto) {
		envuelto = _envuelto
	}
	
	method peso() = envuelto.peso()
	
	method nivelPeligrosidad() = envuelto.nivelPeligrosidad() / 2
	
	method cantidadDeBultos() = 2
	
	method accidente() {
		
	}
}

