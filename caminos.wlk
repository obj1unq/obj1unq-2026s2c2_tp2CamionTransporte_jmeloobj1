import almacen.*
import camion.*

object ruta9 {
  method puedeTransportarACamion(camion) = camion.puedeCircularEnRuta(20)
}

object caminosVecinales {
  var pesoMaximoPermitido = 500
  
  method pesoMaximoPermitido(_pesoMaximoPermitido) {
    pesoMaximoPermitido = _pesoMaximoPermitido
  }
  
  method puedeTransportarACamion(camion) = camion.pesoTotal() <= pesoMaximoPermitido //correcion (feedback)
}

