import cosas.*

object camion {
	const property cosas = #{}
		
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
	  return (!self.tieneExceso() && !cosas.any({cosa => cosa.nivelPeligrosidad() > nivelPeligrosidad}) )
	}
}


object ruta {
  const nivel = 
}

object knightRider {
	method peso() = 500
	method nivelPeligrosidad() = 10
	
	method pesoEsPar() = self.peso() % 2 == 0
}

object arenaAGranel{
	var peso = 0
	
	method peso(_peso) {peso = _peso}
	method peso() = peso
	
	method nivelPeligrosidad() = 1
	
	method pesoEsPar() = self.peso() % 2 == 0
}

object paqueteDeLadrillos{
	var ladrillos = 0
	
	method ladrillos(_ladrillos) {ladrillos = _ladrillos}
	
	method peso() = ladrillos * self.pesoDeLadrillo()
	method nivelPeligrosidad() = 2
	
	method pesoDeLadrillo() = 2
	
	method pesoEsPar() = self.peso() % 2 == 0
}

object residuosRadiactivos{
	var peso = 0

	method peso(_peso) {peso = _peso}
	method peso() = peso
	
	method nivelPeligrosidad() = 200
	
	method pesoEsPar() = self.peso() % 2 == 0
}

object bateriaAntiaerea{
	var misiles = conMisiles 
	
	method misiles(_misiles) {misiles = _misiles}

	method peso() = misiles.peso()
	method nivelPeligrosidad() = misiles.peligrosidad()
	
	method pesoEsPar() = self.peso() % 2 == 0
}
//objetos que son usados en bateriaAntiaerea:
object conMisiles{
	method peso() = 300
	method peligrosidad() = 100
}
object sinMisiles{
	method peso() = 200
	method peligrosidad() = 0
}
//Aca finaliza

object bumblebee{
	var transformacion = transformadoEnAuto
	
	method transformacion(_transformacion) {transformacion = _transformacion}

	method peso() = 800
	method nivelPeligrosidad() = transformacion.peligrosidad()
	
	method pesoEsPar() = self.peso() % 2 == 0
}

//objetos que son usados en bumblebee
object transformadoEnAuto{
	method peligrosidad() = 15
}
object transformadoEnRobot{
	method peligrosidad() = 30
}

