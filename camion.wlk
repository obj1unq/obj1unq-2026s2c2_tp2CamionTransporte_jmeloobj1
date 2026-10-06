import cosas.*

object camion {
	const property cosas = #{}
	
	method cargar(unaCosa) {
		self.validarCarga(unaCosa)
		cosas.add(unaCosa)
	}
	
	method descargar(unaCosa) {
		self.validarDescarga(unaCosa)
		cosas.remove(unaCosa)
	}
	
	method validarCarga(unaCosa) {
		if (self.estaCargadoEnCamion(unaCosa)) self.error(
				("No se puede cargar " + unaCosa) + "debido a que ya se encuentra en el camion"
			)
	}
	
	method validarDescarga(unaCosa) {
		if (!self.estaCargadoEnCamion(unaCosa)) self.error(
				("No se puede descargar " + unaCosa) + "debido a que no se encuentra en el camion"
			)
	}
	
	method vaciarCamion() {
		cosas.clear()
	}
	
	method hayAlgunoQuePesa_(peso) = cosas.any({ cosa => cosa.peso() == peso })
	
	method estaCargadoEnCamion(cosa) = cosas.contains(cosa)
	
	method cadaCosaEnElCamionTienePesoPar() = cosas.all(
		{ cosa => cosa.peso().even() } //correcion (feedback)
	)
	
	method pesoTotal() = 1000 + cosas.sum({ cosa => cosa.peso() })
	
	method tieneExceso() = self.pesoTotal() > 2500
	
	method cosaDeNivel(nivelDePeligrosidad) = cosas.find({ cosa => cosa.nivelPeligrosidad() == nivelDePeligrosidad }) 
	// correcion (feedback)

	
	method cosasPeligrosasConMayorNivelDePeligroQue(nivelDePeligrosidad) {
		return cosas.filter ({cosa => cosa.nivelPeligrosidad() > nivelDePeligrosidad})
	}
		// correcion (feedback)
	method cosasMasPeligrosasQueCosa(cosaIndicada) {
	  return cosas.filter {cosa => cosa.nivelPeligrosidad() > cosaIndicada.nivelPeligrosidad()}
	}
	// correcion (feedback)
	
	method puedeCircularEnRuta(
		nivelPeligrosidad
	) = (!self.tieneExceso()) && (!self.cosaDeNivel(nivelPeligrosidad))
	
	method hayCosaQuePeseEntreMinimoYMaximo(minimo, maximo) = cosas.any(
		{ cosa => cosa.peso().between(minimo , maximo) }
	) // correcion (feedback)
	
	method cosaMasPesada() = cosas.max({ cosa => cosa.peso() })
	
	method pesoDeCadaCosa() {
		return cosas.map({ cosa => cosa.peso() })
	}
	
	method cantidadTotalDeBultos() = cosas.sum({ cosa => cosa.cantidadDeBultos() })
	
	method sufreAccidente() {
		cosas.forEach({ cosa => cosa.accidente() })
	}
	
	method trasportar(destino, camino) {
		camino.puedeTransportarACamion(self)
		destino.almacenarDeCargaDeCamion(self)
	}
}