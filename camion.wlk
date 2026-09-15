import cosas.*

object camion {
	const property cosas = #{}

	method cosa() {
	  return cosas
	}

	method cargar(unaCosa) {
		self.validarCarga(unaCosa)
		cosas.add(unaCosa)
	}
	
	method descargar(unaCosa){
		self.validarDescarga(unaCosa)
		cosas.remove(unaCosa)
	}
	
	method validarCarga(unaCosa) {
		if(self.estaCargadoEnCamion(unaCosa)){
			self.error("No se puede cargar "+ unaCosa + "debido a que ya se encuentra en el camion") 
		}
	}
	
	method validarDescarga(unaCosa) {
		if(!self.estaCargadoEnCamion(unaCosa)){
			self.error("No se puede descargar "+ unaCosa + "debido a que no se encuentra en el camion") 
		}

	}

	method vaciarCamion() {
	  cosas.clear()
	}

	method hayAlgunoQuePesa_(peso) {
	  return cosas.any({cosa => cosa.peso() == peso})
	}

	method estaCargadoEnCamion(cosa) = cosas.contains(cosa)

	method cadaCosaEnElCamionTienePesoPar() = cosas.all({cosa => cosa.pesoEsPar()})

	method pesoTotal() {
	  return 1000 + cosas.sum({cosa => cosa.peso()})
	}

	method tieneExceso() {
	  return self.pesoTotal() > 2500
	}

method hayAlgunoQueTienePeligrosidad_(nivelDePeligrosidad) {
	  return cosas.find()({cosa => cosa.nivelPeligrosidad() == nivelDePeligrosidad})
	}

	method cosasMasPeligrosasQue_(cosaIndicada) {
	  return cosas.filter({cosa => cosa.nivelPeligrosidad() > cosaIndicada.nivelPeligrosidad()})
	}

	method cosasPeligrosas(nivelDePeligrosidad, cosaIndicada) {
	 const cosasPeligrosas = #{}
	 return cosasPeligrosas.add(self.hayAlgunoQueTienePeligrosidad_(nivelDePeligrosidad), self.cosasMasPeligrosasQue_(cosaIndicada))
	}

	method puedeCircularEnRuta(nivelPeligrosidad) {
	  return (!self.tieneExceso() && !self.hayAlgunoQueTienePeligrosidad_(nivelPeligrosidad) )
	}


method hayCosaQuePeseEntreMinimoYMaximo(minimo, maximo){
    return cosas.any({cosa => cosa.peso() >= minimo && cosa.peso() <= maximo})  //  minimo =< cosa.peso() =< maximo
}

method cosaMasPesada(){
    return cosas.max({cosa => cosa.peso()})
}  


method pesoDeCadaCosa() {
    cosas.map({cosa => cosa.peso()})
}

method cantidadTotalDeBultos() {
  return cosas.sum({cosa => cosa.cantidadDeBultos()})
}

method sufreAccidente() {
  cosas.forEach({cosa => cosa.accidente()})
}

method trasportar(destino, camino) {
  if (camino.puedeTransportar_(self) ){
	destino.almacenarDeCamion_(self)
  }
}

}

