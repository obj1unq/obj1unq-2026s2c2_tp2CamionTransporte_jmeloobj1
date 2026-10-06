import almacen.*
import camion.*

object ruta9 {
  method puedeTransportarACamion(camion) = camion.puedeCircularEnRuta(20)
}

object caminosVecinales {
  var property pesoMaximoPermitido = 500
  
  method puedeTransportarACamion(camion) = camion.pesoTotal() <= pesoMaximoPermitido //correcion (feedback)
}

