
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

object contenedorPortuario {
  const objetosDentro = #{}
  
  method peso() {
	return 100 + objetosDentro.sum({objeto => objeto.peso()})
  }

  method nivelPeligrosidad() {
	return if(objetosDentro.isEmpty()){
		0
	}
	else{
		self.peligrosidadDelContenidoMasPeligroso()
	}
  }
	
	method peligrosidadDelContenidoMasPeligroso(){
		 return objetosDentro.map({cosa => cosa.nivelPeligrosidad()}).max()
}

}

object embalajeDeSeguridad {
  
}


